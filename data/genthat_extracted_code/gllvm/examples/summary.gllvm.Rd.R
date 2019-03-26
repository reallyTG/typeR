library(gllvm)


### Name: summary.gllvm
### Title: Summarizing gllvm model fits
### Aliases: summary.gllvm

### ** Examples

## Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
# Fit gllvm model
fit <- gllvm(y = y, family = poisson())
summary(fit)




