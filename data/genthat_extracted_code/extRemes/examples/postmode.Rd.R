library(extRemes)


### Name: postmode
### Title: Posterior Mode from an MCMC Sample
### Aliases: postmode postmode.fevd
### Keywords: methods optimize

### ** Examples

data(ftcanmax)

fit <- fevd(Prec, ftcanmax, method="Bayesian", iter = 1000, verbose=TRUE)

postmode(fit)




