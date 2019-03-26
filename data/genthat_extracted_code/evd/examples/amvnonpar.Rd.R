library(evd)


### Name: amvnonpar
### Title: Non-parametric Estimates for Dependence Functions of the
###   Multivariate Extreme Value Distribution
### Aliases: amvnonpar
### Keywords: nonparametric

### ** Examples

s5pts <- matrix(rexp(50), nrow = 10, ncol = 5)
s5pts <- s5pts/rowSums(s5pts)
sdat <- rmvevd(100, dep = 0.6, model = "log", d = 5)
amvnonpar(s5pts, sdat, d = 5)

## Not run: amvnonpar(data = sdat, plot = TRUE)
## Not run: amvnonpar(data = sdat, plot = TRUE, ord = c(2,3,1), lab = LETTERS[1:3])
## Not run: amvevd(dep = 0.6, model = "log", plot = TRUE)
## Not run: amvevd(dep = 0.6, model = "log", plot = TRUE, blty = 1)



