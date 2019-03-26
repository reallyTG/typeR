library(gamclass)


### Name: RFcluster
### Title: Random forests estimate of predictive accuracy for clustered
###   data
### Aliases: RFcluster
### Keywords: models regression

### ** Examples

## Not run: 
##D library(mlbench)
##D library(randomForest)
##D data(Vowel)
##D RFcluster(formula=Class ~., id = V1, data = Vowel, nfold = 15,
##D               ntree=500, progress=TRUE, printit = TRUE, seed = 29)
## End(Not run)



