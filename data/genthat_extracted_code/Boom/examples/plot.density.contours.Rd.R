library(Boom)


### Name: plot.density.contours
### Title: Contour plot of a bivariate density.
### Aliases: PlotDensityContours
### Keywords: hplot

### ** Examples

## You can see the pairs plot for a single set of draws.
y <- matrix(rnorm(5000, mean = 1:5), ncol = 5, byrow = TRUE)
PlotDensityContours(y, 3, 1)

## You can also compare two or more sets of draws.
z <- matrix(rnorm(2500, mean = 2:6), ncol = 5, byrow = TRUE)
PlotDensityContours(list("first set" = y, "second set" = z), 3, 1)



