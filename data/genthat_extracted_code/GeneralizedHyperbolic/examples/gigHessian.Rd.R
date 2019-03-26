library(GeneralizedHyperbolic)


### Name: gigHessian
### Title: Calculate Two-Sided Hessian for the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigHessian

### ** Examples

### Calculate the approximate Hessian using gigHessian:
param <- c(1,1,1)
dataVector <- rgig(500, param = param)
fit <- gigFit(dataVector)
coef <- coef(fit)
gigHessian(x = dataVector, param = coef, hessianMethod = "tsHessian",
              whichParam = 1)

### Or calculate the approximate Hessian using summary.gigFit method:
summary(fit, hessian = TRUE)



