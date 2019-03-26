library(smooth)


### Name: auto.ces
### Title: Complex Exponential Smoothing Auto
### Aliases: auto.ces
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


y <- ts(rnorm(100,10,3),frequency=12)
# CES with and without holdout
auto.ces(y,h=20,holdout=TRUE)
auto.ces(y,h=20,holdout=FALSE)

library("Mcomp")
## Not run: 
##D y <- ts(c(M3$N0740$x,M3$N0740$xx),start=start(M3$N0740$x),frequency=frequency(M3$N0740$x))
##D # Selection between "none" and "full" seasonalities
##D auto.ces(y,h=8,holdout=TRUE,models=c("n","f"),intervals="p",level=0.8,ic="AIC")
## End(Not run)

y <- ts(c(M3$N1683$x,M3$N1683$xx),start=start(M3$N1683$x),frequency=frequency(M3$N1683$x))
ourModel <- auto.ces(y,h=18,holdout=TRUE,intervals="sp")

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




