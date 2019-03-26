library(ContourFunctions)


### Name: cf_grid
### Title: Makes filled contour plot with an optional sidebar, essentially
###   filled.contour function. This version uses the split.screen()
###   function to add the sidebar if bar is TRUE. By default it won't show
###   the bar but will show the min and max values in the plot title along
###   with their colors. Using this function will make other functions such
###   as points() called afterwards not put points where you expect. Pass
###   anything you want added to the plot area to afterplotfunc as a
###   function to get it to work properly.
### Aliases: cf_grid

### ** Examples

x <- y <- seq(-4*pi, 4*pi, len = 27)
r <- sqrt(outer(x^2, y^2, "+"))
cf_grid(cos(r^2)*exp(-r/(2*pi)))



