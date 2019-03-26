library(partsm)


### Name: Fnextp.test
### Title: Test for the Significance of the p+1 Autoregressive Parameters
###   in an AR(p) or PAR(p) Model
### Aliases: Fnextp.test
### Keywords: ts

### ** Examples

    ## Test the significance of a second order lag in a PAR model for the Real GNP in Germany.
    ## Including seasonal intercepts.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out <- Fnextp.test(wts=lgergnp, detcomp=detcomp, p=1, type="PAR")
  


