library(BiodiversityR)


### Name: ensemble.batch
### Title: Suitability mapping based on ensembles of modelling algorithms:
###   batch processing
### Aliases: ensemble.batch ensemble.mean ensemble.plot

### ** Examples

## Not run: 
##D # based on examples in the dismo package
##D 
##D # get predictor variables
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
##D pres <- read.table(presence_file, header=TRUE, sep=',')
##D pres[,1] <- rep("Bradypus", nrow(pres))
##D 
##D # choose background points
##D background <- randomPoints(predictors, n=1000, extf = 1.00)
##D 
##D # north and south for new predictions (as if new climates)
##D ext2 <- extent(-90, -32, 0, 23)
##D predictors2 <- crop(predictors, y=ext2)
##D predictors2 <- stack(predictors2)
##D predictors2@title <- "north"
##D 
##D ext3 <- extent(-90, -32, -33, 0)
##D predictors3 <- crop(predictors, y=ext3)
##D predictors3 <- stack(predictors3)
##D predictors3@title <- "south"
##D 
##D # fit 3 ensembles with batch processing, choosing the best ensemble model based on the 
##D # average weights of 4-fold split of calibration and testing data
##D # final models use all available presence data and average weights determined by the 
##D # ensemble.calibrate.weights function (called internally)
##D # batch processing can handle several species by using 3-column species.presence and 
##D # species.absence data sets
##D # note that these calculations can take a while
##D 
##D ensemble.nofactors <- ensemble.batch(x=predictors, 
##D     xn=c(predictors, predictors2, predictors3),
##D     species.presence=pres, 
##D     species.absence=background, 
##D     k.splits=4, k.test=0, 
##D     n.ensembles=3, 
##D     SINK=TRUE, 
##D     layer.drops=c("biome"),
##D     ENSEMBLE.best=0, ENSEMBLE.exponent=c(1, 2, 3), 
##D     ENSEMBLE.min=0.7,
##D     MAXENT=1, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     PROBIT=TRUE,
##D     Yweights="BIOMOD",
##D     formulae.defaults=TRUE)
##D 
##D # summaries for the 3 ensembles for the species
##D # summaries are based on files in folders ensemble/suitability, 
##D # ensemble/presence and ensemble/count
##D # ensemble.mean is used internally in ensemble.batch
##D 
##D ensemble.mean(RASTER.species.name="Bradypus", RASTER.stack.name="base",
##D     p=pres, a=background)
##D 
##D # plot mean suitability without specifying colours
##D plot1 <- ensemble.plot(RASTER.species.name="Bradypus", RASTER.stack.name="base",
##D     plot.method="consensussuitability",
##D     p=pres, a=background, abs.breaks=4, pres.breaks=9)
##D plot1
##D 
##D # only colour the areas where species is predicted to be present
##D # option is invoked by having no absence breaks
##D # same colourscheme as \url{http://www.worldagroforestry.org/atlas-central-america}
##D LAatlascols <- grDevices::colorRampPalette(c("#FFFF80", "#38E009","#1A93AB", "#0C1078"))
##D plot2 <- ensemble.plot(RASTER.species.name="Bradypus", RASTER.stack.name="base",
##D     plot.method="consensussuitability",
##D     p=pres, a=background, abs.breaks=0, pres.breaks=9, pres.col=LAatlascols(8))
##D plot2
##D 
##D # only colour the areas where species is predicted to be present
##D # option is invoked by only setting one colour for absence-presence
##D plot3 <- ensemble.plot(RASTER.species.name="Bradypus", RASTER.stack.name="base",
##D     plot.method="consensuspresence",
##D     absencePresence.col=c("#90EE90"))
##D 
##D # only colour presence area by specifying colours > 0
##D plot4 <- ensemble.plot(RASTER.species.name="Bradypus", RASTER.stack.name="base",
##D     plot.method="consensuscount",
##D     count.col=LAatlascols(3))
##D 
##D 
##D 
## End(Not run)




