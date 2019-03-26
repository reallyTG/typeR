library(asbio)


### Name: bayes.lm
### Title: Bayesian linear models with uniform priors
### Aliases: bayes.lm print.blm

### ** Examples

## Not run: 
##D data(Fbird)
##D X <- with(Fbird, cbind(rep(1, 18), vol))
##D Y <- Fbird$freq
##D bayes.lm(Y, X, model = "reg")
## End(Not run)



