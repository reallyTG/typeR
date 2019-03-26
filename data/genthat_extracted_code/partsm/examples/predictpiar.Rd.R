library(partsm)


### Name: predictpiar
### Title: Predictions for a Restricted Periodic Autoregressive Model
### Aliases: predictpiar
### Keywords: models ts

### ** Examples

    ## 24 step-ahead forecasts in a PIAR(2) model for the
    ## logarithms of the Real GNP in Germany.
    data("gergnp")
    lgergnp <- log(gergnp, base=exp(1))
    pred.out <- predictpiar(wts=lgergnp, p=2, hpred=24)
  


