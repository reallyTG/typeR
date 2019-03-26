library(partsm)


### Name: Fpari.piar.test
### Title: Test for a Parameter Restriction in a PAR Model.
### Aliases: Fpari.piar.test
### Keywords: htest

### ** Examples

    ## Test for the unit root 1 in a PAR(2) with seasonal intercepts for
    ## the logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out <- Fpari.piar.test(wts=lgergnp, detcomp=detcomp, p=2, type="PARI1")
  


