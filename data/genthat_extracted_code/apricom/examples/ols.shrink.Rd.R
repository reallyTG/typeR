library(apricom)


### Name: ols.shrink
### Title: Estimation of a Shrinkage Factor for Linear Regression
### Aliases: ols.shrink

### ** Examples

## Shrinkage design matrix examples for a model with an
## intercept and 4 predictors:
## 1. Uniform shrinkage (default design within apricomp).
   sdm1 <- matrix(c(0, rep(1, 4)), nrow = 1)
   print(sdm1)
## 2. Non-uniform shrinkage; 1 shrinkage factor applied only to the
##    first two predictors
   sdm2 <- matrix(c(0, 1, 1, 0, 0), nrow = 1)
   print(sdm2)




