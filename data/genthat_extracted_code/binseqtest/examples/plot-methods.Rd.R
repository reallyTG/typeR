library(binseqtest)


### Name: plot-methods
### Title: Methods for Function 'plot' and 'points' in Package 'binseqtest'
### Aliases: plot-methods plot,boundEst,ANY-method
###   plot,boundEst,missing-method points-methods points,ANY-method
###   points,boundEst-method
### Keywords: methods

### ** Examples

b<-designOBF(50,theta0=.5)
plot(b,bplottype="NE")
plot(b)
b2<-designFixed(49,theta0=.5)
points(b2,rpch=c(17,17,17))





