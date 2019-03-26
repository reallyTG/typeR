library(partsm)


### Name: PAR.MVrepr-methods
### Title: Method for Building the Matrices for the Multivariate
###   Representation of a PAR Model
### Aliases: PAR.MVrepr-methods PAR.MVrepr,ANY-method
###   PAR.MVrepr,fit.partsm-method PAR.MVrepr,fit.piartsm-method
### Keywords: methods

### ** Examples

    ## Load data and select the deterministic components.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)

    ## Multivariate representation of a PAR(2) model with sesonal intercepts.
    out.par <- fit.ar.par(wts=lgergnp, type="PAR", detcomp=detcomp, p=2)
    PAR.MVrepr(out.par)

    ## Multivariate representation of a PIAR(2) model with sesonal intercepts.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    PAR.MVrepr(out.piar)
  


