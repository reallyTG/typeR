library(freeknotsplines)


### Name: plot.freekt
### Title: Plot Fitted Values for Free-Knot Spline
### Aliases: plot.freekt
### Keywords: nonparametric regression smooth

### ** Examples

x <- 0:30/30
truey <- x*sin(10*x)
set.seed(10556)
y <- truey + rnorm(31, 0, 0.2)
xy.freekt <- freelsgen(x, y, degree = 2, numknot = 2, 555)
plot.freekt(xy.freekt, xfit = 0:1000/1000)



