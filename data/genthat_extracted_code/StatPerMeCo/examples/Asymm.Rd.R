library(StatPerMeCo)


### Name: Asymm
### Title: Asymmetric loss function
### Aliases: Asymm
### Keywords: Statistical Performance Measure Asymmetric loss function

### ** Examples


X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

Asymm(S,H,b=3)




