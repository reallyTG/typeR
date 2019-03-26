library(partsm)


### Name: fit.piar
### Title: Fit a Periodically Integrated Autoregressive Model.
### Aliases: fit.piar
### Keywords: ts models

### ** Examples

    ## Fit a PIAR(2) model for the logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2, initvalues=NULL)
  


