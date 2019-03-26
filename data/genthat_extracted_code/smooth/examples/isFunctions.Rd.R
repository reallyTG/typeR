library(smooth)


### Name: is.smooth
### Title: Smooth classes checkers
### Aliases: is.smooth is.vsmooth is.smoothC is.msarima is.iss is.viss
###   is.smooth.sim is.vsmooth.sim is.smooth.forecast
### Keywords: ts univar

### ** Examples


ourModel <- msarima(rnorm(100,100,10))

is.smooth(ourModel)
is.iss(ourModel)
is.msarima(ourModel)
is.vsmooth(ourModel)




