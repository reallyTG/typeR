library(MultiRobust)


### Name: def.quantreg
### Title: Define a Linear Quantile Regression Model
### Aliases: def.quantreg

### ** Examples

# A quantile regression model with response Y and covariates X1 and X2 at the 75th percentile
reg <- def.quantreg(formula = Y ~ X1 + X2, tau = 0.75)



