library(rvinecopulib)


### Name: plot.bicop_dist
### Title: Plotting tools for 'bicop_dist' and 'bicop' objects
### Aliases: plot.bicop_dist contour.bicop_dist plot.bicop contour.bicop
###   plot.bicop contour.bicop_dist contour.bicop
### Keywords: plot

### ** Examples


## construct bicop_dist object for a student t copula
obj <- bicop_dist(family = "t", rotation = 0, parameters = c(0.7,4))

## plots
plot(obj)  # surface plot of copula density
contour(obj)  # contour plot with standard normal margins
contour(obj, margins = "unif")  # contour plot of copula density




