library(bnclassify)


### Name: loglik
### Title: Compute (penalized) log-likelihood.
### Aliases: loglik AIC.bnc_bn BIC.bnc_bn logLik.bnc_bn cLogLik

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
logLik(nb, car)   
AIC(nb, car)
BIC(nb, car)
cLogLik(nb, car)   



