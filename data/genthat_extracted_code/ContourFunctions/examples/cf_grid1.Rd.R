library(ContourFunctions)


### Name: cf_grid1
### Title: Makes filled contour plot without sidebar, essentially
###   filled.contour function. A sidebar can be added by setting bar to
###   TRUE. However, this will cause any other plot functions used
###   afterwards, such as points, to not put points at the correct spot.
### Aliases: cf_grid1

### ** Examples

x <- y <- seq(-4*pi, 4*pi, len = 27)
r <- sqrt(outer(x^2, y^2, "+"))
cf_grid1(cos(r^2)*exp(-r/(2*pi)))



