library(McSpatial)


### Name: sarml
### Title: Spatial AR Maximum-Likelihood Estimation
### Aliases: sarml
### Keywords: Spatial AR Model Parametric Models

### ** Examples

library(spdep)

cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$CHICAGO==1&cmap$CAREA!="O'Hare",]
samppop <- cmap$POPULATION>0&cmap$AREA>0
cmap <- cmap[samppop,]
cmap$lndens <- log(cmap$POPULATION/cmap$AREA)
lmat <- coordinates(cmap)
cmap$LONGITUDE <- lmat[,1]
cmap$LATITUDE  <- lmat[,2]
cmap$dcbd <- geodistance(longvar=cmap$LONGITUDE,latvar=cmap$LATITUDE,
  lotarget=-87.627800,latarget=41.881998)$dist

fit <- makew(shpfile=cmap,eigenvalues=TRUE)
wmat <- fit$wmat
eigvar <- fit$eigvar

# input w, calculate eigvar within sarml
fit <- sarml(lndens~dcbd,wmat=wmat,eigvar=eigvar,data=cmap)




