library(generalCorr)


### Name: mag
### Title: Approximate overall magnitudes of kernel regression partials
###   dx/dy and dy/dx.
### Aliases: mag
### Keywords: derivatives partial

### ** Examples


set.seed(123);x=sample(1:10);y=1+2*x+rnorm(10)
mag(x,y)#dxdy approx=.5 and dydx approx=2 will be nice.




