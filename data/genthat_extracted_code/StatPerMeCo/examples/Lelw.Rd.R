library(StatPerMeCo)


### Name: Lelw
### Title: Loss function defined in Eq. (4.6) of Engle et al. (2016)
### Aliases: Lelw
### Keywords: Statistical Performance Measure Elw loss function

### ** Examples

X = matrix(rnorm(4000),ncol=4)
S = diag(4)
H = cov(X)

Lelw(S, H)



