library(StatPerMeCo)


### Name: LE
### Title: Euclidean distance
### Aliases: LE
### Keywords: Statistical Performance Measure Euclidean distance

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

LE(S, H)



