library(barsurf)


### Name: barsurf
### Title: Bar Plots and Surface Plots in 3d
### Aliases: plot3d.empty plot3d.bar plot3d.surf

### ** Examples

#bar plot in 3d
#note the two commas
x = y = 1:4
f = function (x, y) x ^ 2 + y ^ 2
z = outer (x, y, f)
plot3d.bar (,,z)



