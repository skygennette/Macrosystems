install.packages("sf")
install.packages("terra")
install.packages("dplyr")

library(dplyr)
library(sf)
library(terra)


getwd()

niwot_aop_polygons <- st_read("field-data/mapped-polygons/niwot_aop_polygons_2023_12_8_23_analysis_ready.gpkg") 
aop_gordon_ortho <- rast("field-data/uas-packages/AOP-GORDON-08-14-23-ExportPackage/AOP-GORDON-8-14-23-M300_ORTHO.tif")
crs(aop_gordon_ortho)
crs(niwot_aop_polygons) ##need to switch

gordon_dat=na.omit(extract(x=aop_gordon_ortho,y=niwot_aop_polygons))
gordon_dat_coversub=data.frame(gordon_dat,cover_sub=niwot_aop_polygons$cover_subcategory[gordon_dat$ID]) 
View(gordon_dat_coversub)

gordon_dat_coversub$cover_sub<-as.factor(gordon_dat_coversub$cover_sub)
table(gordon_dat_coversub$cover_sub)
