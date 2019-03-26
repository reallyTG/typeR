library(TSPred)


### Name: fittestLM
### Title: Automatically finding fittest linear model for prediction
### Aliases: fittestLM
### Keywords: fittest linear model ARIMA polynomial regression automatic
###   fitting Kalman filter adjustment prediction evaluation criterion
###   errors

### ** Examples

## Not run: 
##D data(CATS,CATS.cont)
##D fittest <- fittestLM(CATS[,1],CATS.cont[,1])
##D 
##D #fittest model information
##D fittest$rank[1,]
##D 
##D #predictions of the fittest model
##D fittest$ranked.results[[1]]$pred
## End(Not run)



