library(GeneralizedHyperbolic)


### Name: hyperbHessian
### Title: Calculate Two-Sided Hessian for the Hyperbolic Distribution
### Aliases: hyperbHessian sumX

### ** Examples

### Calculate the exact Hessian using hyperbHessian:
param <- c(2, 2, 2, 1)
dataVector <- rhyperb(500, param = param)
fit <- hyperbFit(dataVector, method = "BFGS")
coef <- coef(fit)
hyperbHessian(x = dataVector, param = coef, hessianMethod = "exact",
              whichParam = 2)
              
### Or calculate the exact Hessian using summary.hyperbFit method:
summary(fit, hessian = TRUE)


## Calculate the approximate Hessian:
summary(fit, hessian = TRUE, hessianMethod = "tsHessian")



