library(StatPerMeCo)


### Name: Leig
### Title: Eigenvalue loss function
### Aliases: Leig
### Keywords: Statistical Performance Measure Eigenvalue loss function

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

Leig(S, H)



