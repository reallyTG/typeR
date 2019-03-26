library(geoR)


### Name: loglik.GRF
### Title: Log-Likelihood for a Gaussian Random Field
### Aliases: loglik.GRF
### Keywords: spatial

### ** Examples

loglik.GRF(s100, cov.pars=c(0.8, .25), nugget=0.2)
loglik.GRF(s100, cov.pars=c(0.8, .25), nugget=0.2, met="RML")

## Computing the likelihood of a model fitted by ML
s100.ml <- likfit(s100, ini=c(1, .5))
s100.ml
s100.ml$loglik
loglik.GRF(s100, obj=s100.ml)

## Computing the likelihood of a variogram fitted model
s100.v <- variog(s100, max.dist=1)
s100.vf <- variofit(s100.v, ini=c(1, .5))
s100.vf
loglik.GRF(s100, obj=s100.vf)



