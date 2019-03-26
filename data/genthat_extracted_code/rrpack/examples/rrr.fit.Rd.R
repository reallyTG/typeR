library(rrpack)


### Name: rrr.fit
### Title: Fitting reduced-rank regression with a specific rank
### Aliases: rrr.fit

### ** Examples

Y <- matrix(rnorm(400), 100, 4)
X <- matrix(rnorm(800), 100, 8)
rfit <- rrr.fit(Y, X, nrank = 2)
coef(rfit)



