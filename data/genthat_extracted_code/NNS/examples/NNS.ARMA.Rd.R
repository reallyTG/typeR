library(NNS)


### Name: NNS.ARMA
### Title: NNS ARMA
### Aliases: NNS.ARMA
### Keywords: Autoregressive model

### ** Examples


## Nonlinear NNS.ARMA using AirPassengers monthly data and 12 period lag
## Not run: 
##D NNS.ARMA(AirPassengers, h = 45, training.set = 100, seasonal.factor = 12, method = "nonlin")
## End(Not run)

## Linear NNS.ARMA using AirPassengers monthly data and 12, 24, and 36 period lags
## Not run: 
##D NNS.ARMA(AirPassengers, h = 45, training.set = 120, seasonal.factor = c(12, 24, 36), method = "lin")
## End(Not run)

## Nonlinear NNS.ARMA using AirPassengers monthly data and 2 best periods lag
## Not run: 
##D NNS.ARMA(AirPassengers, h = 45, training.set = 120, seasonal.factor = FALSE, best.periods = 2)
## End(Not run)




