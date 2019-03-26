library(artfima)


### Name: seriesa
### Title: Series A from Box and Jenkins
### Aliases: seriesa
### Keywords: datasets

### ** Examples

data(seriesa)
#compare ARMA(1,1) models and timings
system.time(arima(seriesa, order=c(1,0,1)))
system.time(artfima(seriesa, arimaOrder=c(1,0,1)))
#Remark: there is a slight difference due to the fact that arima() 
#uses the exact MLE for the mean parameter whereas artfima() uses
#the sample average. In practice, the difference is almost negible.
#
#Find AIC/BIC 3 best models. Takes about 15 sec
## Not run: 
##D system.time(ans <- bestModels(seriesa, nbest=3))
##D summary(ans) #summary provides plausibility as well as scores
## End(Not run)



