library(BiodiversityR)


### Name: ensemble.raster
### Title: Suitability mapping based on ensembles of modelling algorithms:
###   consensus mapping
### Aliases: ensemble.raster ensemble.habitat.change ensemble.area

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
##D     "bio16", "bio17"))
##D predictors
##D predictors@title <- "base"
##D 
##D # presence points
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D 
##D # choose background points
##D background <- randomPoints(predictors, n=1000, extf = 1.00)
##D 
##D # if desired, change working directory where subfolders of "models" and 
##D # "ensembles" will be created
##D # raster layers will be saved in subfolders of /models and /ensembles:
##D getwd()
##D 
##D # first calibrate the ensemble
##D # calibration is done in two steps
##D # in step 1, a k-fold procedure is used to determine the weights
##D # in step 2, models are calibrated for all presence and background locations
##D # factor is not used as it is not certain whether correct levels will be used
##D # it may therefore be better to use dummy variables
##D 
##D # step 1: determine weights through 4-fold cross-validation
##D ensemble.calibrate.step1 <- ensemble.calibrate.weights(
##D     x=predictors, p=pres, a=background, k=4, 
##D     SINK=TRUE, species.name="Bradypus",
##D     MAXENT=1, MAXLIKE=0, GBM=1, GBMSTEP=0, RF=0, GLM=1, GLMSTEP=0, 
##D     GAM=1, GAMSTEP=0, MGCV=1, MGCVFIX=0,
##D     EARTH=1, RPART=1, NNET=1, FDA=1, SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     ENSEMBLE.tune=TRUE, PROBIT=TRUE,
##D     ENSEMBLE.best=0, ENSEMBLE.exponent=c(1, 2, 3),
##D     ENSEMBLE.min=c(0.65, 0.7),
##D     Yweights="BIOMOD",
##D     PLOTS=FALSE, formulae.defaults=TRUE)
##D 
##D # step 1 generated the weights for each algorithm
##D model.weights <- ensemble.calibrate.step1$output.weights
##D x.batch <- ensemble.calibrate.step1$x
##D p.batch <- ensemble.calibrate.step1$p
##D a.batch <- ensemble.calibrate.step1$a
##D MAXENT.a.batch <- ensemble.calibrate.step1$MAXENT.a
##D factors.batch <- ensemble.calibrate.step1$factors
##D dummy.vars.batch <- ensemble.calibrate.step1$dummy.vars
##D 
##D # step 2: calibrate models with all available presence locations
##D # weights determined in step 1 calculate ensemble in step 2
##D ensemble.calibrate.step2 <- ensemble.calibrate.models(
##D     x=x.batch, p=p.batch, a=a.batch, MAXENT.a=MAXENT.a.batch, 
##D     factors=factors.batch, dummy.vars=dummy.vars.batch, 
##D     SINK=TRUE, species.name="Bradypus",
##D     models.keep=TRUE,
##D     input.weights=model.weights,
##D     ENSEMBLE.tune=FALSE, PROBIT=TRUE,
##D     Yweights="BIOMOD",
##D     PLOTS=FALSE, formulae.defaults=TRUE)
##D 
##D # step 3: use previously calibrated models to create ensemble raster layers
##D # re-evaluate the created maps at presence and background locations
##D # (note that re-evaluation will be different due to truncation of raster layers
##D # as they wered saved as integer values ranged 0 to 1000)
##D ensemble.raster.results <- ensemble.raster(xn=predictors, 
##D     models.list=ensemble.calibrate.step2$models, 
##D     input.weights=model.weights,
##D     SINK=TRUE, evaluate=TRUE,
##D     RASTER.species.name="Bradypus", RASTER.stack.name="base")
##D 
##D # use the base map to check for changes in suitable habitat
##D # this type of analysis is typically done with different predictor layers
##D # (for example, predictor layers representing different possible future climates)
##D # In this example, changes from a previous model (ensemble.raster.results)
##D # are contrasted with a newly calibrated model (ensemble.raster.results2)
##D # step 1: 4-fold cross-validation
##D ensemble.calibrate2.step1 <- ensemble.calibrate.weights(
##D     x=x.batch, p=p.batch, a=a.batch, MAXENT.a=MAXENT.a.batch, 
##D     factors=factors.batch, dummy.vars=dummy.vars.batch, 
##D     k=4, 
##D     SINK=TRUE, species.name="Bradypus",
##D     MAXENT=1, MAXLIKE=0, GBM=1, GBMSTEP=0, RF=0, GLM=1, GLMSTEP=0, 
##D     GAM=1, GAMSTEP=0, MGCV=1, MGCVFIX=0,
##D     EARTH=1, RPART=1, NNET=1, FDA=1, SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     ENSEMBLE.tune=TRUE, PROBIT=TRUE,
##D     ENSEMBLE.best=0, ENSEMBLE.exponent=c(1, 2, 3),
##D     ENSEMBLE.min=c(0.65, 0.7),
##D     Yweights="BIOMOD",
##D     PLOTS=FALSE, formulae.defaults=TRUE)
##D 
##D model.weights2 <- ensemble.calibrate2.step1$output.weights
##D 
##D ensemble.calibrate2.step2 <- ensemble.calibrate.models(
##D     x=x.batch, p=p.batch, a=a.batch, MAXENT.a=MAXENT.a.batch, 
##D     factors=factors.batch, dummy.vars=dummy.vars.batch, 
##D     SINK=TRUE, species.name="Bradypus",
##D     models.keep=TRUE,
##D     input.weights=model.weights2,
##D     ENSEMBLE.tune=FALSE, PROBIT=TRUE,
##D     Yweights="BIOMOD",
##D     PLOTS=FALSE, formulae.defaults=TRUE)
##D 
##D ensemble.raster.results2 <- ensemble.raster(
##D     xn=predictors, 
##D     models.list=ensemble.calibrate2.step2$models, 
##D     input.weights=model.weights2,
##D     SINK=TRUE, evaluate=TRUE,
##D     RASTER.species.name="Bradypus", RASTER.stack.name="recalibrated")
##D 
##D base.file <- paste(getwd(), "/ensembles/presence/Bradypus_base.grd", sep="")
##D other.file <- paste(getwd(), "/ensembles/presence/Bradypus_recalibrated.grd", sep="")
##D 
##D changed.habitat <- ensemble.habitat.change(base.map=base.file, 
##D     other.maps=c(other.file),
##D     change.folder="ensembles/change")
##D 
##D change.file <- paste(getwd(), "/ensembles/change/Bradypus_recalibrated_presence.grd", sep="")
##D 
##D par.old <- graphics::par(no.readonly=T)
##D dev.new()
##D par(mfrow=c(2,2))
##D raster::plot(raster(base.file), breaks=c(-1, 0, 1), col=c("grey", "green"), 
##D     legend.shrink=0.8, main="base presence")
##D raster::plot(raster(other.file), breaks=c(-1, 0, 1), col=c("grey", "green"), 
##D     legend.shrink=0.8, main="other presence")
##D raster::plot(raster(change.file), breaks=c(-1, 0, 1, 10, 11), 
##D     col=c("grey", "blue", "red", "green"), 
##D     legend.shrink=0.8, main="habitat change", sub="11 remaining, 10 lost, 1 new")
##D graphics::par(par.old)
##D 
##D areas <- ensemble.area(raster(change.file))
##D areas
## End(Not run)



