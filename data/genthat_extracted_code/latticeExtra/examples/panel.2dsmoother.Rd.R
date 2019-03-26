library(latticeExtra)


### Name: panel.2dsmoother
### Title: Plot a smooth approximation of z over x and y.
### Aliases: panel.2dsmoother
### Keywords: dplot

### ** Examples

set.seed(1)
xyz <- data.frame(x = rnorm(100), y = rnorm(100))
xyz$z <- with(xyz, x * y + rnorm(100, sd = 1))

levelplot(z ~ x * y, xyz, panel = panel.2dsmoother)

## showing data points on the same color scale
levelplot(z ~ x * y, xyz,
          panel = panel.levelplot.points, cex = 1.2) +
  layer_(panel.2dsmoother(..., n = 200))

## simple linear regression model
levelplot(z ~ x * y, xyz,
          panel = panel.levelplot.points) +
  layer_(panel.2dsmoother(..., method = "lm"))

## GAM smoother with smoothness by cross validation
if (require("mgcv"))
  levelplot(z ~ x * y, xyz, panel = panel.2dsmoother,
            form = z ~ s(x, y), method = "gam")



