library(partsm)


### Name: plotpdiff
### Title: Graphical Representation of the Periodically Differenced Data
### Aliases: plotpdiff
### Keywords: hplot

### ** Examples

    ## Load data and select the deterministic components.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)

    ## Fit a PIAR(2) model with seasonal intercepts.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    plotpdiff(out.piar)
  


