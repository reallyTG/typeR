library(gllvm)


### Name: coefplot.gllvm
### Title: Plot covariate coefficients and confidence intervals
### Aliases: coefplot.gllvm coefplot

### ** Examples

## Load a dataset from the mvabund package
data(antTraits)
y <- as.matrix(antTraits$abund)
X <- as.matrix(antTraits$env)
# Fit model with environmental covariates
fit <- gllvm(y, X, formula = ~ Bare.ground + Shrub.cover,
            family = poisson())
coefplot.gllvm(fit)

## No test: 
# Fit model with all environmental covariates
fitx <- gllvm(y, X, family = "negative.binomial")
coefplot(fitx, mfrow = c(3,2))
coefplot(fitx, which.Xcoef = 1:2)

# Fit gllvm model with environmental and trait covariates
TR <- antTraits$traits
fitT <- gllvm(y = y, X = X, TR = TR, family = "negative.binomial")
coefplot(fitT)
## End(No test)



