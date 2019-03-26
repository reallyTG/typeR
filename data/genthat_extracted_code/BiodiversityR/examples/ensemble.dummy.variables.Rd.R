library(BiodiversityR)


### Name: ensemble.dummy.variables
### Title: Suitability mapping based on ensembles of modelling algorithms:
###   handling of categorical data
### Aliases: ensemble.dummy.variables ensemble.accepted.categories
###   ensemble.simplified.categories

### ** Examples

## Not run: 
##D 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D biome.layer <- predictors[["biome"]]
##D biome.layer
##D 
##D # create dummy layers for the 5 most frequent factor levels
##D 
##D ensemble.dummy.variables(xcat=biome.layer, most.frequent=5,
##D     overwrite=TRUE)
##D 
##D # check whether dummy variables were created
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D predictors
##D names(predictors)
##D 
##D # once dummy variables were created, avoid using the original categorical data layer
##D predictors <- subset(predictors, subset=c("bio5", "bio6", "bio16", "bio17", 
##D     "biome_1", "biome_2", "biome_7", "biome_8", "biome_13"))
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
##D # note that dummy variables with no variation are not used by DOMAIN
##D # note that dummy variables are not used by MAHAL and MAHAL01
##D # (neither are categorical variables)
##D ensemble.nofactors <- ensemble.calibrate.models(x=predictors, p=pres_train, a=backg_train, 
##D     pt=pres_test, at=backg_test,
##D     species.name="Bradypus",
##D     VIF=T,
##D     MAXENT=1, MAXLIKE=1, GBM=1, GBMSTEP=0, RF=1, GLM=1, GLMSTEP=0, GAM=1, 
##D     GAMSTEP=0, MGCV=1, MGCVFIX=0, EARTH=1, RPART=1, NNET=1, FDA=1, 
##D     SVM=1, SVME=1, BIOCLIM.O=1, BIOCLIM=1, DOMAIN=1, MAHAL=0, MAHAL01=1,
##D     Yweights="BIOMOD", 
##D     dummy.vars=c("biome_1", "biome_2", "biome_7", "biome_8", "biome_13"),
##D     PLOTS=FALSE, evaluations.keep=TRUE)
## End(Not run)




