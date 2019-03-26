library(rrpack)


### Name: rrs.fit
### Title: Fitting reduced-rank ridge regression with given rank and
###   shrinkage penalty
### Aliases: rrs.fit

### ** Examples

library(rrpack)
Y <- matrix(rnorm(400), 100, 4)
X <- matrix(rnorm(800), 100, 8)
rfit <- rrs.fit(Y, X)



