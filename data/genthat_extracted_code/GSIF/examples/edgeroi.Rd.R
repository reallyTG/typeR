library(GSIF)


### Name: edgeroi
### Title: The Edgeroi Data Set
### Aliases: edgeroi edgeroi.grids edgeroi.grids100
### Keywords: datasets

### ** Examples

library(rgdal)
library(aqp)
library(sp)

data(edgeroi)
edgeroi$sites[edgeroi$sites$SOURCEID=="399_EDGEROI_ed095_1",]
edgeroi$horizons[edgeroi$horizons$SOURCEID=="399_EDGEROI_ed095_1",]
## spPoints:
sites <- edgeroi$sites
coordinates(sites) <- ~ LONGDA94 + LATGDA94
proj4string(sites) <- CRS("+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs")
sites <- spTransform(sites, CRS("+init=epsg:28355"))

## Not run: 
##D ## plot points and grids:
##D pnts <- list("sp.points", sites, pch="+", col="black")
##D ## load the 250 m grids:
##D con <- url("http://gsif.isric.org/lib/exe/fetch.php?media=edgeroi.grids.rda")
##D load(con)
##D str(edgeroi.grids)
##D gridded(edgeroi.grids) <- ~x+y
##D proj4string(edgeroi.grids) <- CRS("+init=epsg:28355")
##D spplot(edgeroi.grids[1], sp.layout=pnts)
##D ## load the 100 m grids:
##D con2 <- url("http://gsif.isric.org/lib/exe/fetch.php?media=edgeroi.grids100.rda")
##D load(con2) 
##D str(edgeroi.grids100)
##D gridded(edgeroi.grids100) <- ~x+y
##D proj4string(edgeroi.grids100) <- CRS("+init=epsg:28355")
##D spplot(edgeroi.grids100["TI1LAN6"], sp.layout=pnts)
## End(Not run)



