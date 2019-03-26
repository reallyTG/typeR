library(partsm)


### Name: show-methods
### Title: Methods for Function 'show' in Package 'partsm'
### Aliases: show-methods show,ANY-method show,traceable-method
###   show,ObjectsWithPackage-method show,MethodDefinition-method
###   show,MethodWithNext-method show,genericFunction-method
###   show,classRepresentation-method show,fit.partsm-method
###   show,fit.piartsm-method show,Ftest.partsm-method
###   show,LRur.partsm-method show,pred.piartsm-method show,MVPAR-method
###   show,MVPIAR-method
### Keywords: methods

### ** Examples

    ## Load data and select the deterministic components.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    detcomp <- list(regular=c(0,0,0), seasonal=c(1,0), regvar=0)

    ## Fit an AR(4) model with intercept and seasonal dummies.
    dcar <- list(regular=c(1,0,c(1,2,3)), seasonal=c(0,0), regvar=0)
    out.ar <- fit.ar.par(wts=lgergnp, type="AR", detcomp=dcar, p=4)
    show(out.ar)

    ## Fit a PAR(2) model with seasonal intercepts.
    out.par <- fit.ar.par(wts=lgergnp, type="PAR", detcomp=detcomp, p=2)
    show(out.par)

    ## Fnextp.test
    Fnextp.out <- Fnextp.test(wts=lgergnp, detcomp=detcomp, p=1, type="PAR")
    show(Fnextp.out)

    ## Fpar.test
    Fpar.out <- Fpar.test(wts=lgergnp, detcomp=detcomp, p=2)
    show(Fpar.out)

    ## Fsh.test
    ar4 <- fit.ar.par(wts=lgergnp, type="AR", p=4, detcomp=detcomp)
    Fsh.out <- Fsh.test(res=residuals(ar4@lm.ar), s=frequency(lgergnp))
    show(Fsh.out)

    ## Fit a PIAR(2) model with seasonal intercepts.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    show(out.piar)

    ## Fpari.piar.test
    Fpari1.out <- Fpari.piar.test(wts=lgergnp, detcomp=detcomp, p=2, type="PARI1")
    show(Fpari1.out)

    ## Fit a PIAR(2) model with seasonal intercepts.
    out.piar <- fit.piar(wts=lgergnp, detcomp=detcomp, p=2)
    show(out.piar)

    ## Test for a single unit root in a PAR(2) model with seasonal intercepts.
    out.LR <- LRurpar.test(wts=lgergnp, detcomp=detcomp, p=2)
    show(out.LR)

    ## 24 step-ahead forecasts in a PIAR(2) model.
    pred.out <- predictpiar(wts=lgergnp, p=2, hpred=24)
    show(pred.out)
  


