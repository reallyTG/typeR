library(partsm)


### Name: plotpredpiar
### Title: Plot of the Out-of-Sample Forecasts in a PIAR Model
### Aliases: plotpredpiar
### Keywords: hplot

### ** Examples

    ## Load data and select the deterministic components.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))

    ## Fit a PIAR(2) model with seasonal intercepts.
    out.pred <- predictpiar(wts=lgergnp, p=2, hpred=24)
    plotpredpiar(out.pred)
  


