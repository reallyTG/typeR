library(StatPerMeCo)


### Name: Stein
### Title: Stein loss function.
### Aliases: Stein
### Keywords: Statistical Performance Measure Stein loss function

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

Stein(S, H)



