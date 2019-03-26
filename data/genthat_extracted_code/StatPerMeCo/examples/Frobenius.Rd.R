library(StatPerMeCo)


### Name: Frobenius
### Title: Frobenius distance
### Aliases: Frobenius
### Keywords: Statistical Performance Measure Frobenius distance

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

Frobenius(S, H)



