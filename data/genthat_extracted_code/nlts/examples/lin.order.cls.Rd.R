library(nlts)


### Name: lin.order.cls
### Title: The order of a time series using cross-validation of the linear
###   autoregressive model (conditional least-squares).
### Aliases: lin.order.cls
### Keywords: ts

### ** Examples


    data(plodia)
    fit <- lin.order.cls(sqrt(plodia), order=1:5)
    ## Not run: plot(fit)
    summary(fit)



