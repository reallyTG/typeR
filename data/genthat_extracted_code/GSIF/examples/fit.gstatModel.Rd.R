library(GSIF)


### Name: fit.gstatModel-methods
### Title: Methods to fit a regression-kriging model
### Aliases: fit.gstatModel-method fit.gstatModel
###   fit.gstatModel,SpatialPointsDataFrame,formula,SpatialPixelsDataFrame-method
###   fit.gstatModel,geosamples,formula,SpatialPixelsDataFrame-method
###   fit.gstatModel,geosamples,formula,list-method
###   fit.gstatModel,geosamples,list,list-method
### Keywords: methods

### ** Examples

# 2D model:
library(sp)
library(boot)
library(aqp)
library(plyr)
library(rpart)
library(splines)
library(gstat)
library(randomForest)
library(quantregForest)
library(plotKML)

## load the Meuse data set:
demo(meuse, echo=FALSE)

## simple model:
omm <- fit.gstatModel(meuse, om~dist+ffreq, meuse.grid,
   family = gaussian(log))
om.rk <- predict(omm, meuse.grid)
plot(om.rk)
## it was succesful!

## fit a GLM with a gaussian log-link:
omm <- fit.gstatModel(meuse, om~dist+ffreq, meuse.grid, 
   fit.family = gaussian(log))
summary(omm@regModel)
om.rk <- predict(omm, meuse.grid)
plot(om.rk)

## fit a regression-tree:
omm <- fit.gstatModel(meuse, log1p(om)~dist+ffreq, meuse.grid, 
   method="rpart")
summary(omm@regModel)
## plot a regression-tree:
plot(omm@regModel, uniform=TRUE)
text(omm@regModel, use.n=TRUE, all=TRUE, cex=.8)
omm@vgmModel    

## fit a randomForest model:
omm <- fit.gstatModel(meuse, om~dist+ffreq, meuse.grid, 
   method="randomForest")
## plot to see how good is the fit:
plot(omm)
## plot the estimated error for number of bootstrapped trees:
plot(omm@regModel)
omm@vgmModel
om.rk <- predict(omm, meuse.grid)
plot(om.rk)
## Compare with "quantregForest" package:
omm <- fit.gstatModel(meuse, om~dist+ffreq, meuse.grid, 
   method="quantregForest")
## Not run: 
##D om.rk <- predict(omm, meuse.grid, nfold=0)
##D plot(om.rk)
##D ## plot the results in Google Earth:
##D plotKML(om.rk)
## End(Not run)

## binary variable (0/1):
meuse$soil.1 <- as.numeric(I(meuse$soil==1))
som <- fit.gstatModel(meuse, soil.1~dist+ffreq, meuse.grid, 
   fit.family = binomial(logit))
summary(som@regModel)
som.rk <- predict(som, meuse.grid)
plot(som.rk)
## Not run: 
##D # plot the results in Google Earth:
##D plotKML(som.rk)
## End(Not run)

## 3D model:
library(plotKML)
data(eberg)
## list columns of interest:
s.lst <- c("ID", "soiltype", "TAXGRSC", "X", "Y")
h.lst <- c("UHDICM","LHDICM","SNDMHT","SLTMHT","CLYMHT")
sel <- runif(nrow(eberg))<.05
## get sites table:
sites <- eberg[sel,s.lst]
## get horizons table:
horizons <- getHorizons(eberg[sel,], idcol="ID", sel=h.lst)
## create object of type "SoilProfileCollection"
eberg.spc <- join(horizons, sites, type='inner')
depths(eberg.spc) <- ID ~ UHDICM + LHDICM
site(eberg.spc) <- as.formula(paste("~", paste(s.lst[-1], collapse="+"), sep=""))
coordinates(eberg.spc) <- ~X+Y
proj4string(eberg.spc) <- CRS("+init=epsg:31467")
## convert to geosamples:
eberg.geo <- as.geosamples(eberg.spc)
## covariates:
data(eberg_grid)
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
glm.formulaString = as.formula(paste("SNDMHT ~ ", 
  paste(names(eberg_grid), collapse="+"), "+ ns(altitude, df=4)"))
SNDMHT.m <- fit.gstatModel(observations=eberg.geo, glm.formulaString, 
  covariates=eberg_grid)
plot(SNDMHT.m)
## problems with the variogram?
## Not run: 
##D ## remove classes from the PRMGEO6 that are not represented in the model:
##D sel = !(levels(eberg_grid$PRMGEO6) %in% levels(SNDMHT.m@regModel$model$PRMGEO6))
##D fix.c = levels(eberg_grid$PRMGEO6)[sel]
##D summary(eberg_grid$PRMGEO6)
##D for(j in fix.c){
##D   eberg_grid$PRMGEO6[eberg_grid$PRMGEO6 == j] <- levels(eberg_grid$PRMGEO6)[7]
##D }
##D ## prepare new locations:
##D new3D <- sp3D(eberg_grid)
##D ## regression only:
##D SNDMHT.rk.sd1 <- predict(SNDMHT.m, new3D[[1]], vgmmodel=NULL)
##D ## regression-kriging:
##D SNDMHT.rk.sd1 <- predict(SNDMHT.m, new3D[[1]])
##D ## plot the results in Google Earth:
##D plotKML(SNDMHT.rk.sd1, z.lim=c(5,85))
## End(Not run)



