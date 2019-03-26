library(gllvm)


### Name: logLik.gllvm
### Title: Log-likelihood of gllvm
### Aliases: logLik.gllvm

### ** Examples

## Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
# Fit gllvm model
fit <- gllvm(y = y, family = poisson())
# log-Likelihood:
logLik(fit)




