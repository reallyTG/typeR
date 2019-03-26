library(NNS)


### Name: NNS.ARMA.optim
### Title: NNS ARMA Optimizer
### Aliases: NNS.ARMA.optim
### Keywords: Autoregressive model

### ** Examples


## Nonlinear NNS.ARMA period optimization using 5 yearly lags on AirPassengers monthly data
## Not run: 
##D nns.optims <- NNS.ARMA.optim(AirPassengers, training.set = 132, seasonal.factor = seq(12, 60, 12))
## End(Not run)

## Then use optimal parameters in NNS.ARMA
## Not run: 
##D NNS.ARMA(AirPassengers, training.set=132, seasonal.factor = nns.optims$periods,
##D method = nns.optims$method)
## End(Not run)




