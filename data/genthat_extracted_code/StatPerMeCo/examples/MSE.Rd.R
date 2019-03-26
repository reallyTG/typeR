library(StatPerMeCo)


### Name: MSE
### Title: Mean Square Error
### Aliases: MSE
### Keywords: Statistical Performance Measure Mean Square Error

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

MSE(S, H)



