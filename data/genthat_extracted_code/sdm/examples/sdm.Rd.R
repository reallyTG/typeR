library(sdm)


### Name: sdm
### Title: Fit and evaluate species distribution models
### Aliases: sdm sdm,ANY,sdmdata,character-method
###   sdm,sdmdata,.sdmCorSetting,ANY-method
###   sdm,ANY,sdmdata,.sdmCorSetting-method
### Keywords: spatial,species,sdm, model

### ** Examples

## Not run: 
##D file <- system.file("external/pa_df.csv", package="sdm")
##D 
##D df <- read.csv(file)
##D 
##D head(df) 
##D 
##D d <- sdmData(sp~b15+NDVI,train=df)
##D 
##D d
##D #----
##D # Example 1: fit using 3 models, and no evaluation (evaluation based on training dataset):
##D 
##D m <- sdm(sp~b15+NDVI,data=d,methods=c('glm','gam','gbm'))
##D 
##D m
##D 
##D # Example 3: fit using 5 models, and 
##D # evaluates using 10 runs of subsampling replications taking 30 percent as test:
##D 
##D m <- sdm(sp~b15+NDVI,data=d,methods=c('glm','gam','gbm','svm','rf'),
##D           replication='sub',test.percent=30,n=10)
##D 
##D m
##D 
##D 
##D # Example 3: fits using 5 models, and 
##D # evaluates using 10 runs of both 5-folds cross-validation and bootsrapping replication methods
##D 
##D m <- sdm(sp~.,data=d,methods=c('gbm','tree','mars','mda','fda'),
##D           replication=c('cv','boot'),cv.folds=5,n=10)
##D 
##D m
##D 
##D # Example 4: fit using 3 models; evaluate the models using subsampling, 
##D # and override the default settings for the method brt:
##D 
##D m <- sdm(sp~b15+NDVI,data=d,methods=c('glm','gam','brt'),test.p=30,
##D           modelSettings=list(brt=list(n.trees=500,train.fraction=0.8)))
##D 
##D m
##D 
## End(Not run)




