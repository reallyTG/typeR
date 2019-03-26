library(evd)


### Name: mvevd
### Title: Parametric Multivariate Extreme Value Distributions
### Aliases: pmvevd rmvevd dmvevd
### Keywords: distribution

### ** Examples

pmvevd(matrix(rep(0:4,5), ncol=5), dep = .7, model = "log", d = 5)
pmvevd(rep(4,5), dep = .7, model = "log", d = 5)
rmvevd(10, dep = .7, model = "log", d = 5)
dmvevd(rep(-1,20), dep = .7, model = "log", d = 20, log = TRUE)

asy <- list(.4, .1, .6, c(.3,.2), c(.1,.1), c(.4,.1), c(.2,.3,.2))
pmvevd(rep(2,3), dep = c(.6,.5,.8,.3), asy = asy, model = "alog", d = 3)
asy <- list(.4, .0, .6, c(.3,.2), c(.1,.1), c(.4,.1), c(.2,.4,.2))
rmvevd(10, dep = c(.6,.5,.8,.3), asy = asy, model = "alog", d = 3)
dmvevd(rep(0,3), dep = c(.6,.5,.8,.3), asy = asy, model = "alog", d = 3)

asy <- list(0, 0, 0, 0, c(0,0), c(0,0), c(0,0), c(0,0), c(0,0), c(0,0),
  c(.2,.1,.2), c(.1,.1,.2), c(.3,.4,.1), c(.2,.2,.2), c(.4,.6,.2,.5))
rmvevd(10, dep = .7, asy = asy, model = "alog", d = 4)
rmvevd(10, dep = c(rep(1,6), rep(.7,5)), asy = asy, model = "alog", d = 4)



