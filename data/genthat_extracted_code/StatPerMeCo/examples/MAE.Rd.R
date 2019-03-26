library(StatPerMeCo)


### Name: MAE
### Title: Mean Absolute Error
### Aliases: MAE
### Keywords: Statistical Performance Measure Mean Absolute Error

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

MAE(S, H)



