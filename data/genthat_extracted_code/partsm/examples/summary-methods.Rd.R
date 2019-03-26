library(partsm)


### Name: summary-methods
### Title: Methods for Function 'summary' in Package 'partsm'
### Aliases: summary-methods summary,ANY-method summary,fit.partsm-method
###   summary,fit.piartsm-method summary,Ftest.partsm-method
###   summary,LRur.partsm-method
### Keywords: methods

### ** Examples

    ## Load data and select the deterministic components.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)

    ## Fit an AR(4) model with intercept and seasonal dummies.
    dcar <- list(regular=c(1,0,c(1,2,3)), seasonal=c(0,0), regvar=0)
    out.ar <- fit.ar.par(wts=lgergnp, type="AR", detcomp=dcar, p=4)
    summary(out.ar)

    ## Fit a PAR(2) model with seasonal intercepts.
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)
    out.par <- fit.ar.par(wts=lgergnp, type="PAR", detcomp=detcomp, p=2)
    summary(out.par)

    ## Fnextp.test
    Fnextp.out <- Fnextp.test(wts=lgergnp, detcomp=detcomp, p=1, type="PAR")
    summary(Fnextp.out)

    ## Fpar.test
    Fpar.out <- Fpar.test(wts=lgergnp, detcomp=detcomp, p=2)
    summary(Fpar.out)

    ## Fsh.test
    ar4 <- fit.ar.par(wts=lgergnp, type="AR", p=4, detcomp=detcomp)
    Fsh.out <- Fsh.test(res=residuals(ar4@lm.ar), s=frequency(lgergnp))
    summary(Fsh.out)

    ## Fit a PIAR(2) model.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    summary(out.piar)

    ## Fpari.piar.test
    Fpari1.out <- Fpari.piar.test(wts=lgergnp, detcomp=detcomp, p=2, type="PARI1")
    summary(Fpari1.out)

    ## Fit a PIAR(2) model with seasonal intercepts.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    summary(out.piar)
    
    ## Test for a single unit root in a PAR(2) model with seasonal intercepts.
    out.LR <- LRurpar.test(wts=lgergnp, detcomp=detcomp, p=2)
    summary(out.LR)
  


