library(partsm)


### Name: fit.ar.par
### Title: Fit an Autoregressive or Periodic Autoregressive Model
### Aliases: fit.ar.par
### Keywords: ts models

### ** Examples

    ## Models for the the logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))

    ## Fit an AR(4) model with intercept and seasonal dummies.
    detcomp <- list(regular=c(1,0,c(1,2,3)), seasonal=c(0,0), regvar=0)
    out.ar <- fit.ar.par(wts=lgergnp, type="AR", detcomp=detcomp, p=4)

    ## Fit a PAR(2) model with seasonal intercepts.
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out.par <- fit.ar.par(wts=lgergnp, type="PAR", detcomp=detcomp, p=2)
  


