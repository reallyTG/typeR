library(gllvm)


### Name: residuals.gllvm
### Title: Dunn-Smyth residuals for gllvm model
### Aliases: residuals.gllvm

### ** Examples

# Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
# Fit gllvm model
fit <- gllvm(y = y, family = poisson())
# residuals
res <- residuals(fit)




