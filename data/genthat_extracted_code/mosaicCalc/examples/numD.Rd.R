library(mosaicCalc)


### Name: numD
### Title: Numerical Derivatives
### Aliases: numD setInterval setCorners dfdx d2fdxdy d2fdx2
###   numerical.first.partial numerical.second.partial
###   numerical.mixed.partial

### ** Examples

g = numD( a*x^2 + x*y ~ x, a=1)
g(x=2,y=10)
gg = numD( a*x^2 + x*y ~ x&x, a=1)
gg(x=2,y=10)
ggg = numD( a*x^2 + x*y ~ x&y, a=1)
ggg(x=2,y=10)
h = numD( g(x=x,y=y,a=a) ~ y, a=1)
h(x=2,y=10)
f = numD( sin(x)~x, add.h.control=TRUE)
# plotFun( f(3,.hstep=h)~h, hlim=range(.00000001,.000001))
# ladd( panel.abline(cos(3),0))



