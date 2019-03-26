library(npsp)


### Name: splot
### Title: Utilities for plotting with a color scale
### Aliases: hot.colors jet.colors scolor splot
### Keywords: hplot

### ** Examples


scale.range <- range(aquifer$head)
splot(slim = scale.range)
with( aquifer, plot(lon, lat, col = scolor(head, slim = scale.range), 
       pch = 16, cex = 1.5, main = "Wolfcamp aquifer data"))
# equivalent to:
# with( aquifer, spoints(lon, lat, head, main = "Wolfcamp aquifer data"))

#
# Multiple plots with a common legend:
#
# regularly spaced 2D data...
set.seed(1)
nx <- c(40, 40) # ndata =  prod(nx)
x1 <- seq(-1, 1, length.out = nx[1])
x2 <- seq(-1, 1, length.out = nx[2])
trend <- outer(x1, x2, function(x,y) x^2 - y^2)
y <- trend + rnorm(prod(nx), 0, 0.1)
scale.range <- c(-1.2, 1.2)
scale.color <- heat.colors(64)
# 1x2 plot with some room for the legend...
old.par <- par(mfrow = c(1,2), omd = c(0.05, 0.85, 0.05, 0.95))
image( x1, x2, trend, zlim = scale.range, main = 'Trend', col = scale.color)
image( x1, x2, y, zlim = scale.range, main = 'Data', col = scale.color)
par(old.par)
# the legend can be added to any plot...
splot(slim = scale.range, col = scale.color, add = TRUE)
## note that argument 'zlim' in 'image' corresponds with 'slim' in 'sxxxx' functions. 



