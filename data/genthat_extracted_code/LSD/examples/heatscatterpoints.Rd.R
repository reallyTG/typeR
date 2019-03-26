library(LSD)


### Name: heatscatterpoints
### Title: A colored scatterplot based on a two-dimensional Kernel Density
###   Estimation (add to an existing plot)
### Aliases: LSD.heatscatterpoints heatscatterpoints
### Keywords: heatcolors scatterplot,

### ** Examples

points = 10^4
x = c(rnorm(points/2),rnorm(points/2)+4)
y = x + rnorm(points,sd=0.8)
x = sign(x)*abs(x)^1.3

plot.new()
plot.window(xlim = c(-5,15),ylim = c(-4,8))
heatscatterpoints(x,y,add.contour=TRUE,color.contour="green",greyscale=TRUE)
axis(1)
axis(2)
box()



