library(fractal)


### Name: lmACF
### Title: ACF, PACF, and ACVF for various stochastic fractal time series
###   models
### Aliases: lmACF
### Keywords: univar models nonlinear

### ** Examples

models <- c("ppl","fdp","fgn")
lag <- 100
z <- lapply(models, function(x, models, lag)
    { lmACF(lmModel(x), lag=lag)@data},
    models=models, lag=lag)
names(z) <- paste(upperCase(models), "ACF")
stackPlot(seq(0,lag), z, xlab="lag")
title("Stochastic Fractal Model ACFs")



