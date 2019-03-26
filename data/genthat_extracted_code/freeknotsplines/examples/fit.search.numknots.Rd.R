library(freeknotsplines)


### Name: fit.search.numknots
### Title: Perform a Search on the Number of Knots and Fit Free-Knot
###   Splines To Data Using the Optimal Number of Knots
### Aliases: fit.search.numknots
### Keywords: nonparametric regression smooth

### ** Examples

x <- 0:30/30
truey <- x*sin(10*x)
set.seed(10556)
y <- truey + rnorm(31, 0, 0.2)
xy.freekt <- fit.search.numknots(x, y, degree = 2, minknot = 1, maxknot = 3, seed = 555)
plot.freekt(xy.freekt, xfit = 0:1000/1000)



