library(partsm)


### Name: LRurpar.test
### Title: Likelihood Ratio Test for a Single Unit Root in a PAR(p) Model
### Aliases: LRurpar.test
### Keywords: htest

### ** Examples

    ## Test for a single unit root in a PAR(2) model with seasonal intercepts for the
    ## logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out <- LRurpar.test(wts=lgergnp, detcomp=detcomp, p=2)
  


