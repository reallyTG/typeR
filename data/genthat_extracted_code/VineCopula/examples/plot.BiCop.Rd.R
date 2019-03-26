library(VineCopula)


### Name: plot.BiCop
### Title: Plotting tools for BiCop objects
### Aliases: plot.BiCop contour.BiCop
### Keywords: plot

### ** Examples


## construct BiCop object for a Tawn copula
obj <- BiCop(family = 104, par = 2.5, par2 = 0.4)

## plots
plot(obj)  # surface plot of copula density
contour(obj)  # contour plot with standard normal margins
contour(obj, margins = "unif")  # contour plot of copula density




