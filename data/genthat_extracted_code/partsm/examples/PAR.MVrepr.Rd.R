library(partsm)


### Name: PAR.MVrepr 
### Title: Multivariate representation of a PAR model
### Aliases: 'PAR.MVrepr '
### Keywords: ts

### ** Examples

    ## Models for the the logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))

    ## Fit an PAR model
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out.par <- fit.ar.par(wts=lgergnp, type="PAR", detcomp=detcomp, p=2)

    ## Show the matrix representation: 
    out.MV <- PAR.MVrepr(out.par)
    out.MV
  


