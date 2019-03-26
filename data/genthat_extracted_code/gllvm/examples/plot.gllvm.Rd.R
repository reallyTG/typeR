library(gllvm)


### Name: plot.gllvm
### Title: Plot Diagnostics for an gllvm Object
### Aliases: plot.gllvm

### ** Examples

## Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
# Fit gllvm model with Poisson family
fit <- gllvm(y, family = poisson())
# Plot residuals
plot(fit, mfrow = c(3,2))

## No test: 
# Fit gllvm model with negative binomial family
fitnb <- gllvm(y = y, family = "negative.binomial")
# Plot residuals
plot(fitnb, mfrow = c(3,2))
# Plot only two first plots
plot(fitnb, which = 1:2, mfrow = c(1,2))
## End(No test)



