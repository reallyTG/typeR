library(arfima)


### Name: plot.predarfima
### Title: Plots the original time series, the predictions, and the
###   prediction intervals for a 'predarfima' object.
### Aliases: plot.predarfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(82365)
sim <- arfima.sim(1000, model = list(dfrac = 0.4, theta=0.9, dint = 1))
fit <- arfima(sim, order = c(0, 1, 1), back=TRUE)
fit
pred <- predict(fit, n.ahead = 5)
pred
plot(pred)
#Let's look at more context
plot(pred, numback = 50)
## End(No test)




