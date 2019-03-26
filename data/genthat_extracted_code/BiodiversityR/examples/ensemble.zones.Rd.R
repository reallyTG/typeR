library(BiodiversityR)


### Name: ensemble.zones
### Title: Mapping of environmental zones based on the Mahalanobis distance
###   from centroids in environmental space.
### Aliases: ensemble.zones ensemble.centroids

### ** Examples


## Not run: 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D predictors <- subset(predictors, subset=c("bio1", "bio5", "bio6", "bio7", "bio8", 
##D     "bio12", "bio16", "bio17"))
##D predictors
##D predictors@title <- "base"
##D 
##D # choose background points
##D background <- randomPoints(predictors, n=1000, extf=1.00)
##D 
##D # predicted presence from GLM
##D ensemble.calibrate.step1 <- ensemble.calibrate.models(
##D     x=predictors, p=pres, a=background,
##D     species.name="Bradypus",
##D     MAXENT=0, MAXLIKE=0, GBM=0, GBMSTEP=0, RF=0, GLM=1, GLMSTEP=0, 
##D     GAM=0, GAMSTEP=0, MGCV=0, MGCVFIX=0,
##D     EARTH=0, RPART=0, NNET=0, FDA=0, SVM=0, SVME=0, GLMNET=0,
##D     BIOCLIM.O=0, BIOCLIM=0, DOMAIN=0, MAHAL=0, MAHAL01=0,
##D     Yweights="BIOMOD",
##D     models.keep=TRUE)
##D 
##D ensemble.raster.results <- ensemble.raster(xn=predictors, 
##D     models.list=ensemble.calibrate.step1$models, 
##D     RASTER.species.name="Bradypus", RASTER.stack.name="base")
##D 
##D # get presence map as for example created with ensemble.raster in subfolder 'ensemble/presence'
##D # presence values are values equal to 1
##D presence.file <- paste("ensembles//presence//Bradypus_base.grd", sep="")
##D presence.raster <- raster(presence.file)
##D 
##D # let cascadeKM decide on the number of clusters
##D dev.new()
##D centroids <- ensemble.centroids(presence.raster=presence.raster, 
##D     x=predictors, an=1000, plotit=T)
##D ensemble.zones(presence.raster=presence.raster, centroid.object=centroids, 
##D     x=predictors, RASTER.species.name="Bradypus", KML.out=T)
##D 
##D dev.new()
##D zones.file <- paste("ensembles//zones//Bradypus_base.grd", sep="")
##D zones.raster <- raster(zones.file)
##D max.zones <- maxValue(zones.raster)
##D plot(zones.raster, breaks=c(0, c(1:max.zones)), 
##D     col = grDevices::rainbow(n=max.zones), main="zones")
##D ensemble.zones(presence.raster=presence.raster, centroid.object=centroids, 
##D     x=predictors, RASTER.species.name="Bradypus", KML.out=T)
##D 
##D # manually choose 6 zones
##D dev.new()
##D centroids6 <- ensemble.centroids(presence.raster=presence.raster, 
##D     x=predictors, an=1000, plotit=T, centers=6)
##D ensemble.zones(presence.raster=presence.raster, centroid.object=centroids6, 
##D     x=predictors, RASTER.species.name="Bradypus6", KML.out=T)
##D 
##D dev.new()
##D zones.file <- paste("ensembles//zones//Bradypus6_base.grd", sep="")
##D zones.raster <- raster(zones.file)
##D max.zones <- maxValue(zones.raster)
##D plot(zones.raster, breaks=c(0, c(1:max.zones)), 
##D     col = grDevices::rainbow(n=max.zones), main="six zones")
##D 
## End(Not run)



