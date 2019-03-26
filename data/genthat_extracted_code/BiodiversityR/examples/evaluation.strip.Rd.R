library(BiodiversityR)


### Name: evaluation.strip.data
### Title: Evaluation strips for ensemble suitability mapping
### Aliases: evaluation.strip.data evaluation.strip.plot

### ** Examples

## Not run: 
##D 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", 
##D     "bio16", "bio17"))
##D predictors <- stack(predictors)
##D predictors
##D predictors@title <- "base"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D 
##D # the kfold function randomly assigns data to groups; 
##D # groups are used as calibration (1/5) and training (4/5) data
##D groupp <- kfold(pres, 5)
##D pres_train <- pres[groupp !=  1, ]
##D pres_test <- pres[groupp ==  1, ]
##D 
##D # choose background points
##D background <- randomPoints(predictors, n=1000, extf=1.00)
##D colnames(background)=c('lon', 'lat')
##D groupa <- kfold(background, 5)
##D backg_train <- background[groupa != 1, ]
##D backg_test <- background[groupa == 1, ]
##D 
##D # calibrate the models
##D # MAXLIKE not included as does not allow predictions for data.frames
##D # ENSEMBLE.min and ENSEMBLE.weight.min set very low to explore all
##D # algorithms.
##D # If focus is on actual ensemble, then set ENSEMBLE.min and 
##D # ENSEMBLE.weight.min to more usual values
##D ensemble.calibrate <- ensemble.calibrate.models(x=predictors, 
##D     p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     ENSEMBLE.min=0.5, ENSEMBLE.weight.min = 0.001,
##D     MAXENT=1, MAXLIKE=0, GBM=1, GBMSTEP=1, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=1, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     Yweights="BIOMOD", 
##D     PLOTS=FALSE, models.keep=TRUE)
##D 
##D # obtain data for plotting the evaluation strip
##D strip.data <- evaluation.strip.data(xn=predictors, steps=500,
##D     models.list=ensemble.calibrate$models)
##D 
##D # in case predictions for DOMAIN failed
##D # however, ENSEMBLE should also be recalculated
##D DOMAIN.model <- ensemble.calibrate$models$DOMAIN
##D strip.data$plot.data[, "DOMAIN"] <- dismo::predict(object=DOMAIN.model, 
##D     x=strip.data$plot.data)
##D 
##D # in case predictions for MAHAL01 failed
##D predict.MAHAL01 <- function(model, newdata, MAHAL.shape) {
##D     p <- dismo::predict(object=model, x=newdata)
##D     p <- p - 1 - MAHAL.shape
##D     p <- abs(p)
##D     p <- MAHAL.shape / p
##D     return(as.numeric(p))
##D }
##D 
##D MAHAL01.model <- ensemble.calibrate$models$MAHAL01
##D MAHAL.shape1 <- ensemble.calibrate$models$formulae$MAHAL.shape
##D strip.data$plot.data[, "MAHAL01"] <- predict.MAHAL01(model=MAHAL01.model, 
##D     newdata=strip.data$plot.data, MAHAL.shape=MAHAL.shape1)
##D 
##D # create graphs
##D evaluation.strip.plot(data=strip.data$plot.data, variable.focal="bio6",
##D     TrainData=strip.data$TrainData,
##D     type="o", col="red")
##D evaluation.strip.plot(data=strip.data$plot.data, model.focal="ENSEMBLE",
##D     TrainData=strip.data$TrainData,
##D     type="o", col="red")
##D 
## End(Not run)



