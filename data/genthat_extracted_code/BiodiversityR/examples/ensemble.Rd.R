library(BiodiversityR)


### Name: ensemble.calibrate.models
### Title: Suitability mapping based on ensembles of modelling algorithms:
###   calibration of models and weights
### Aliases: ensemble.calibrate.models ensemble.calibrate.weights
###   ensemble.calibrate.models.gbm ensemble.calibrate.models.nnet
###   ensemble.drop1 ensemble.formulae ensemble.weights ensemble.strategy
###   ensemble.threshold ensemble.VIF ensemble.pairs

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
##D predictors@title <- "predictors"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D 
##D # the kfold function randomly assigns data to groups; 
##D # groups are used as calibration (1/4) and training (3/4) data
##D groupp <- kfold(pres, 4)
##D pres_train <- pres[groupp !=  1, ]
##D pres_test <- pres[groupp ==  1, ]
##D 
##D # choose background points
##D background <- randomPoints(predictors, n=1000, extf=1.00)
##D colnames(background)=c('lon', 'lat')
##D groupa <- kfold(background, 4)
##D backg_train <- background[groupa != 1, ]
##D backg_test <- background[groupa == 1, ]
##D 
##D # formulae for random forest and generalized linear model
##D # compare with: ensemble.formulae(predictors, factors=c("biome"))
##D 
##D rfformula <- as.formula(pb ~ bio5+bio6+bio16+bio17)
##D 
##D glmformula <- as.formula(pb ~ bio5 + I(bio5^2) + I(bio5^3) + 
##D     bio6 + I(bio6^2) + I(bio6^3) + bio16 + I(bio16^2) + I(bio16^3) + 
##D     bio17 + I(bio17^2) + I(bio17^3) )
##D 
##D # fit four ensemble models (RF, GLM, BIOCLIM, DOMAIN)
##D ensemble.nofactors <- ensemble.calibrate.models(x=predictors, p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     species.name="Bradypus",
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.min = 0.65,
##D     MAXENT=0, MAXLIKE=0, GBM=0, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=0, GAM=0, 
##D     GAMSTEP=0, MGCV=0, MGCVFIX=0, EARTH=0, RPART=0, NNET=0, FDA=0, 
##D     SVM=0, SVME=0, GLMNET=0,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=0,
##D     Yweights="BIOMOD",
##D     evaluations.keep=TRUE, models.keep=TRUE,
##D     RF.formula=rfformula,
##D     GLM.formula=glmformula)
##D 
##D # with option models.keep, all model objects are saved in ensemble object
##D # the same slots can be used to replace model objects with new calibrations
##D ensemble.nofactors$models$RF
##D summary(ensemble.nofactors$models$GLM)
##D ensemble.nofactors$models$BIOCLIM
##D ensemble.nofactors$models$DOMAIN
##D ensemble.nofactors$models$formulae
##D 
##D # evaluations are kept in different slot
##D attributes(ensemble.nofactors$evaluations)
##D plot(ensemble.nofactors$evaluations$RF.T, "ROC")
##D 
##D # fit four ensemble models (RF, GLM, BIOCLIM, DOMAIN) using default formulae
##D # variable 'biome' is not included as explanatory variable
##D # results are provided in a file in the 'outputs' subfolder of the working
##D # directory
##D ensemble.nofactors <- ensemble.calibrate.models(x=predictors,
##D     p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     layer.drops="biome",
##D     species.name="Bradypus",
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.min=0.65,
##D     SINK=TRUE,
##D     MAXENT=0, MAXLIKE=0, GBM=0, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=0, GAM=0, 
##D     GAMSTEP=0, MGCV=0, MGCVFIX=0, EARTH=0, RPART=0, NNET=0, FDA=0, 
##D     SVM=0, SVME=0, GLMNET=0,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=0,
##D     Yweights="BIOMOD", 
##D     evaluations.keep=TRUE,
##D     formulae.defaults=TRUE)    
##D 
##D # after fitting the individual algorithms (submodels),
##D # transform predictions with a probit link.
##D ensemble.nofactors <- ensemble.calibrate.models(x=predictors,
##D     p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     layer.drops="biome",
##D     species.name="Bradypus",
##D     SINK=TRUE,
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.min=0.65,
##D     MAXENT=0, MAXLIKE=0, GBM=0, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=0, GAM=0, 
##D     GAMSTEP=0, MGCV=0, MGCVFIX=0, EARTH=0, RPART=0, NNET=0, FDA=0, 
##D     SVM=0, SVME=0, GLMNET=0,
##D     BIOCLIM.O=0, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=0,
##D     PROBIT=TRUE,
##D     Yweights="BIOMOD", factors="biome",
##D     evaluations.keep=TRUE,
##D     formulae.defaults=TRUE)    
##D 
##D # Instead of providing presence and background locations, provide data.frames.
##D # Because 'biome' is a factor, RasterStack needs to be provided
##D # to check for levels in the Training and Testing data set.
##D TrainData1 <- prepareData(x=predictors, p=pres_train, b=backg_train, 
##D     factors=c("biome"), xy=FALSE)
##D TestData1 <- prepareData(x=predictors, p=pres_test, b=backg_test, 
##D     factors=c("biome"), xy=FALSE)
##D ensemble.factors1 <- ensemble.calibrate.models(x=predictors, 
##D     TrainData=TrainData1, TestData=TestData1,
##D     p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     species.name="Bradypus",
##D     SINK=TRUE,
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.min=0.65,
##D     MAXENT=0, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=0, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=1, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     Yweights="BIOMOD", factors="biome",
##D     evaluations.keep=TRUE)
##D 
##D # compare different methods of calculating ensembles
##D ensemble.factors2 <- ensemble.calibrate.models(x=predictors, 
##D     TrainData=TrainData1, TestData=TestData1,
##D     p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     species.name="Bradypus",
##D     SINK=TRUE,
##D     ENSEMBLE.tune=TRUE,
##D     MAXENT=1, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, BIOCLIM.O=1, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     ENSEMBLE.best=c(4:10), ENSEMBLE.exponent=c(1, 2, 3),
##D     Yweights="BIOMOD", factors="biome",
##D     evaluations.keep=TRUE)
##D 
##D # test performance of different suitability models
##D # data are split in 4 subsets, each used once for evaluation
##D ensemble.nofactors2 <- ensemble.calibrate.weights(x=predictors, 
##D     p=pres, a=background, k=4, 
##D     species.name="Bradypus",
##D     SINK=TRUE, PROBIT=TRUE,
##D     MAXENT=1, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, BIOCLIM.O=1, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.best=0, ENSEMBLE.exponent=c(1, 2, 3),
##D     ENSEMBLE.min=0.7,
##D     Yweights="BIOMOD", 
##D     formulae.defaults=TRUE)
##D ensemble.nofactors2$AUC.table
##D 
##D # test the result of leaving out one of the variables from the model
##D # note that positive differences indicate that the model without the variable 
##D # has higher AUC than the full model
##D ensemble.variables <- ensemble.drop1(x=predictors, 
##D     p=pres, a=background, k=4,
##D     species.name="Bradypus",
##D     SINK=TRUE,
##D     difference=TRUE,
##D     VIF=TRUE, PROBIT=TRUE,
##D     MAXENT=0, MAXLIKE=0, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=1, GAM=1, 
##D     GAMSTEP=1, MGCV=1, MGCVFIX=1, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, GLMNET=1,
##D     BIOCLIM.O=0, BIOCLIM=0, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     ENSEMBLE.tune=TRUE,
##D     ENSEMBLE.best=0, ENSEMBLE.exponent=c(1, 2, 3),
##D     ENSEMBLE.min=0.7,
##D     Yweights="BIOMOD", factors="biome")
##D ensemble.variables
##D 
##D # use function ensemble.VIF to select a subset of variables
##D # factor variables are not handled well by the function
##D # and therefore factors are removed
##D # however, one can check for factors with car::vif through
##D # the ensemble.calibrate.models function
##D # VIF.analysis$var.drops can be used as input for ensemble.calibrate.models or
##D # ensemble.calibrate.weights
##D 
##D predictors <- stack(predictor.files)
##D predictors <- subset(predictors, subset=c("bio1", "bio5", "bio6", "bio8", 
##D     "bio12", "bio16", "bio17", "biome"))
##D 
##D ensemble.pairs(predictors)
##D 
##D VIF.analysis <- ensemble.VIF(predictors, factors="biome")
##D VIF.analysis
##D # alternative solution where bio1 and bio12 are kept
##D VIF.analysis <- ensemble.VIF(predictors, factors="biome", 
##D     keep=c("bio1", "bio12"))
##D VIF.analysis
## End(Not run)



