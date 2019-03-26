library(GeneralizedHyperbolic)


### Name: nigHessian
### Title: Calculate Two-Sided Hessian for the Normal Inverse Gaussian
###   Distribution
### Aliases: nigHessian

### ** Examples

### Calculate the exact Hessian using nigHessian:
param <- c(2, 2, 2, 1)
dataVector <- rnig(500, param = param)
fit <- nigFit(dataVector, method = "BFGS")
coef=coef(fit)
nigHessian(x=dataVector, param=coef, hessianMethod = "tsHessian",
           whichParam = 2)
              
### Or calculate the exact Hessian using summary.nigFit method:
### summary(fit, hessian = TRUE)

## Calculate the approximate Hessian:
summary(fit, hessian = TRUE, hessianMethod = "tsHessian")



