library(malariaAtlas)


### Name: getShp
### Title: Download MAPadmin2013 Administrative Boundary Shapefiles from
###   the MAP geoserver
### Aliases: getShp

### ** Examples

#Download PfPR data & associated shapefiles for Nigeria and Cameroon
## No test: 
NGA_CMR_PR <- getPR(country = c("Nigeria", "Cameroon"), species = "Pf")
NGA_CMR_shp <- getShp(country = c("Nigeria", "Cameroon"))

#Download PfPR data & associated shapefiles for Chad
Chad_PR <- getPR(ISO = "TCD", species = "both")
Chad_shp <- getShp(ISO = "TCD")

#' #Download PfPR data & associated shapefiles defined by extent for Madagascar
MDG_PR <- getPR(country = "Madagascar", species = "Pv")
## End(No test)





