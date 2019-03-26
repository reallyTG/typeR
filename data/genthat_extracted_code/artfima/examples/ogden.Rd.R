library(artfima)


### Name: ogden
### Title: Mean Annual St.  Lawrence Riverflow
### Aliases: ogden
### Keywords: datasets

### ** Examples

data(ogden)
#compare fits of AR(1) and TFD
arima(ogden, order=c(1,0,0))
artfima(ogden) #this model has one more parameter

#Find AIC/BIC 3 best models. Takes about 10 sec
## Not run: 
##D system.time(ans <- bestModels(ogden, nbest=3))
##D summary(ans) #summary provides plausibility as well as scores
## End(Not run)



