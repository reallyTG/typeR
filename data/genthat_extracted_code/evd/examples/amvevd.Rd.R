library(evd)


### Name: amvevd
### Title: Parametric Dependence Functions of Multivariate Extreme Value
###   Models
### Aliases: amvevd
### Keywords: distribution

### ** Examples

amvevd(dep = 0.5, model = "log")
s3pts <- matrix(rexp(30), nrow = 10, ncol = 3)
s3pts <- s3pts/rowSums(s3pts)
amvevd(s3pts, dep = 0.5, model = "log")
## Not run: amvevd(dep = 0.05, model = "log", plot = TRUE, blty = 1)
amvevd(dep = 0.95, model = "log", plot = TRUE, lower = 0.94)

asy <- list(.4, .1, .6, c(.3,.2), c(.1,.1), c(.4,.1), c(.2,.3,.2))
amvevd(s3pts, dep = 0.15, asy = asy, model = "alog")
amvevd(dep = 0.15, asy = asy, model = "al", plot = TRUE, lower = 0.7)



