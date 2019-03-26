library(npsp)


### Name: rgraphics
### Title: R Graphics for gridded data
### Aliases: contour.data.grid image.data.grid persp.data.grid rgraphics

### ** Examples

# Regularly spaced 2D data
grid <- grid.par(n = c(50, 50), min = c(-1, -1), max = c(1, 1))

f2d <- function(x) x[1]^2 - x[2]^2
trend <- apply(coords(grid), 1, f2d)
set.seed(1)
y <- trend + rnorm(prod(dim(grid)), 0, 0.1)
gdata <- data.grid(trend = trend, y = y, grid = grid)

# perspective plot
persp(gdata, main = 'Trend', theta = 40, phi = 20, ticktype = "detailed")

# filled contour plot
contour(gdata, main = 'Trend', filled = TRUE, color.palette = jet.colors)

# Multiple plots with a common legend:
scale.range <- c(-1.2, 1.2)
scale.color <- jet.colors(64)
# 1x2 plot with some room for the legend...
old.par <- par(mfrow = c(1,2), omd = c(0.05, 0.85, 0.05, 0.95))
image(gdata, zlim = scale.range, main = 'Trend', col = scale.color)
contour(gdata, add = TRUE)
image(gdata, 'y', zlim = scale.range, main = 'Data', col = scale.color)
contour(gdata, 'y', add = TRUE)
par(old.par)
# the legend can be added to any plot...
splot(slim = scale.range, col = scale.color, add = TRUE)



