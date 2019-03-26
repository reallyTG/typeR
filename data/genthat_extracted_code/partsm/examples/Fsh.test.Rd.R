library(partsm)


### Name: Fsh.test
### Title: Test for Seasonal Heteroskedasticity
### Aliases: Fsh.test
### Keywords: htest

### ** Examples

    ## Fsh test for the residuals of the first differences
    ## of the logarithms of the Real GNP in Germany
    ## on an AR(4) model with seasonal intercepts.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    wts <- ts(c(NA, diff(gergnp, lag=1)), frequency=4, start=start(lgergnp))

    detcomp=list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    ar4 <- fit.ar.par(wts=lgergnp, type="AR", p=4, detcomp=detcomp)
    out <- Fsh.test(res=residuals(ar4@lm.ar), s=frequency(wts))
  


