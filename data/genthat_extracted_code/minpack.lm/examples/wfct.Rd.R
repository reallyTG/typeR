library(minpack.lm)


### Name: wfct
### Title: Weighting function that can be supplied to the 'weights'
###   argument of 'nlsLM' or 'nls'
### Aliases: wfct
### Keywords: nonlinear optimize regression

### ** Examples


### Examples from 'nls' doc ###
## note that 'nlsLM' below may be replaced with calls to 'nls'
Treated <- Puromycin[Puromycin$state == "treated", ]

## Weighting by inverse of response 1/y_i:
nlsLM(rate ~ Vm * conc/(K + conc), data = Treated,
start = c(Vm = 200, K = 0.05), weights = wfct(1/rate))

## Weighting by square root of predictor \sqrt{x_i}:
nlsLM(rate ~ Vm * conc/(K + conc), data = Treated,
start = c(Vm = 200, K = 0.05), weights = wfct(sqrt(conc)))

## Weighting by inverse square of fitted values 1/\hat{y_i}^2:
nlsLM(rate ~ Vm * conc/(K + conc), data = Treated,
start = c(Vm = 200, K = 0.05), weights = wfct(1/fitted^2))

## Weighting by inverse variance 1/\sigma{y_i}^2:
nlsLM(rate ~ Vm * conc/(K + conc), data = Treated,
start = c(Vm = 200, K = 0.05), weights = wfct(1/error^2))




