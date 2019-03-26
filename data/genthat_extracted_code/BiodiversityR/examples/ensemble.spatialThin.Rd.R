library(BiodiversityR)


### Name: ensemble.spatialThin
### Title: Spatial thinning of presence point locations using the highly
###   accurate geodesic estimates from the geosphere package
### Aliases: ensemble.spatialThin

### ** Examples

## Not run: 
##D # get predictor variables, only needed for plotting
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", 
##D     "bio16", "bio17", "biome"))
##D predictors
##D predictors@title <- "base"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[, -1]
##D 
##D # number of locations
##D nrow(pres)
##D 
##D par.old <- graphics::par(no.readonly=T)
##D par(mfrow=c(2,2))
##D 
##D pres.thin1 <- ensemble.spatialThin(pres, thin.km=100, runs=10, verbose=T)
##D plot(predictors[[1]], main="10 runs", ext=extent(SpatialPoints(pres.thin1)))
##D points(pres.thin1, pch=20, col="red")
##D 
##D pres.thin2 <- ensemble.spatialThin(pres, thin.km=100, runs=10, verbose=T)
##D plot(predictors[[1]], main="10 runs", ext=extent(SpatialPoints(pres.thin2)))
##D points(pres.thin2, pch=20, col="red")
##D 
##D pres.thin3 <- ensemble.spatialThin(pres, thin.km=100, runs=100, verbose=T)
##D plot(predictors[[1]], main="100 runs", ext=extent(SpatialPoints(pres.thin3)))
##D points(pres.thin3, pch=20, col="red")
##D 
##D pres.thin4 <- ensemble.spatialThin(pres, thin.km=100, runs=100, verbose=T)
##D plot(predictors[[1]], main="100 runs", ext=extent(SpatialPoints(pres.thin4)))
##D points(pres.thin4, pch=20, col="red")
##D 
##D graphics::par(par.old)
##D 
## End(Not run)




