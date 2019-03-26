library(partsm)


### Name: Fpar.test
### Title: Test for Periodic Variation in the Autoregressive Parameters
### Aliases: Fpar.test
### Keywords: htest

### ** Examples

    ## Test for periodicity in a second order PAR model for
    ## the logarithms of the Real GNP in Germany time series.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out <- Fpar.test(wts=lgergnp, detcomp=detcomp, p=2)
  


