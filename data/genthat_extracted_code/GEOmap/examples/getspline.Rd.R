library(GEOmap)


### Name: getspline
### Title: Get a spline curve along a set of points
### Aliases: getspline
### Keywords: misc

### ** Examples

plot(c(-5,5), c(-5,5), asp=1, type='n' )
ff=list()
ff$x=c(-4.850,-4.700,-3.934,-2.528, 0.603, 2.647, 3.861, 2.626)
ff$y=c(-4.045,-2.087,-0.710, 0.172, 1.291, 2.087,-0.753,-4.131)

lines(ff, col='red')
G =getspline(ff$x, ff$y, kdiv=20)

lines(G, col='blue')





