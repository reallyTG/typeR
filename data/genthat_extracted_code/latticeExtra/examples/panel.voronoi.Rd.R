library(latticeExtra)


### Name: panel.voronoi
### Title: Panel functions for level-coded irregular points
### Aliases: panel.voronoi panel.levelplot.points
### Keywords: hplot

### ** Examples

## a variant of Figure 5.6 from Sarkar (2008)
## http://lmdvr.r-forge.r-project.org/figures/figures.html?chapter=05;figure=05_06

depth.ord <- rev(order(quakes$depth))
quakes$Magnitude <- equal.count(quakes$mag, 4)
quakes.ordered <- quakes[depth.ord, ]

levelplot(depth ~ long + lat | Magnitude, data = quakes.ordered,
         panel = panel.levelplot.points, type = c("p", "g"),
         aspect = "iso", prepanel = prepanel.default.xyplot)

## a levelplot with jittered cells

xyz <- expand.grid(x = 0:9, y = 0:9)
xyz[] <- jitter(as.matrix(xyz))
xyz$z <- with(xyz, sqrt((x - 5)^2 + (y - 5)^2))
levelplot(z ~ x * y, xyz, panel = panel.voronoi, points = FALSE)

## hexagonal cells

xyz$y <- xyz$y + c(0, 0.5)
levelplot(z ~ x * y, xyz, panel = panel.voronoi, points = FALSE)



