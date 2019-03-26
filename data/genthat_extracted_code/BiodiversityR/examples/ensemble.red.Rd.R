library(BiodiversityR)


### Name: ensemble.red
### Title: Area of Occupancy (AOO) and Extent of Occurrence (EOO) via the
###   'red' library.
### Aliases: ensemble.red ensemble.chull.create ensemble.chull.apply

### ** Examples


## Not run: 
##D 
##D ## Not run: 
##D # based on examples in the dismo package
##D 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", 
##D     "bio16", "bio17"))
##D predictors
##D predictors@title <- "red"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')
##D 
##D # fit 5 ensemble models (could take some time!)
##D # (examples for the red package use 100 models)
##D ensembles <- ensemble.batch(x=predictors, 
##D     xn=c(predictors),
##D     species.presence=pres, 
##D     thin.km=100,
##D     k.splits=4, k.test=0, 
##D     n.ensembles=5, 
##D     SINK=TRUE, 
##D     ENSEMBLE.best=10, ENSEMBLE.exponent=c(1, 2, 3), 
##D     ENSEMBLE.min=0.6,
##D     MAXENT=0, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     PROBIT=TRUE,
##D     Yweights="BIOMOD",
##D     formulae.defaults=TRUE)
##D 
##D # first application of ensemble.red before applying the convex hull mask
##D # AOO and EOO are determined for each count level
##D library(red)
##D count.file <- paste(getwd(), "/ensembles/consensuscount/Bradypus variegatus_red.grd", sep="")
##D count.raster <- raster(count.file)
##D ensemble.red(count.raster)
##D 
##D # do not predict presence in polygons completely outside convex hull
##D # of known presence locations
##D pres.file <- paste(getwd(), "/ensembles/consensuspresence/Bradypus variegatus_red.grd", sep="")
##D pres.raster <- raster(pres.file)
##D pres1 <- pres[, -1]
##D chull.created <- ensemble.chull.create(x.pres=pres.raster, p=pres1)
##D 
##D mask.raster <- chull.created$mask.layer
##D mask.poly <- chull.created$convex.hull
##D par.old <- graphics::par(no.readonly=T)
##D par(mfrow=c(1,2))
##D plot(pres.raster, breaks=c(-1, 0, 1), col=c("grey", "green"),
##D     main="before convex hull")
##D points(pres1, col="blue")
##D 
##D pres.chull <- ensemble.chull.apply(pres.raster, mask=mask.raster, keep.old=T)
##D # load new
##D pres.file <- paste(getwd(), "/ensembles/consensuspresence/Bradypus variegatus_red.grd", sep="")
##D pres.raster <- raster(pres.file)
##D plot(pres.raster, breaks=c(-1, 0, 1), col=c("grey", "green"),
##D     main="after convex hull")
##D plot(mask.poly, add=T, border="blue")
##D 
##D # new application of ensemble.red
##D dev.new()
##D plot(count.raster, main="before convex hull")
##D ensemble.red(count.raster)
##D # all cells where species is predicted not to be present according to the mask layer
##D # will be modified to a count of zero
##D count.chull <- ensemble.chull.apply(count.raster, mask=mask.raster, keep.old=T)
##D # load new
##D count.file <- paste(getwd(), "/ensembles/consensuscount/Bradypus variegatus_red.grd", sep="")
##D count.raster <- raster(count.file)
##D ensemble.red(count.raster)
##D dev.new()
##D plot(count.raster, main="after convex hull")
##D par.old <- graphics::par(no.readonly=T)
##D 
## End(Not run)



