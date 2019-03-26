library(cpr)


### Name: bsplines
### Title: B-Splines
### Aliases: bsplines

### ** Examples

# build a vector of values to transform
xvec <- seq(-3, 5, length = 100)

# cubic b-spline
bmat <- bsplines(xvec, iknots = c(-2, 0, 0.2))
bmat

# plot the splines
plot(bmat)

# If you want a second x-axis to show the x-values try the following:
second_x_axis <- round(stats::quantile(xvec, probs = seq(0, 1, by = .2)), 2)

plot(bmat) +
ggplot2::annotate(geom = "text", x = second_x_axis, y = -0.02, label = second_x_axis) +
ggplot2::annotate(geom = "linerange", x = second_x_axis, ymin = -0.05, ymax = -0.04) +
ggplot2::coord_cartesian(ylim = c(0, 1))

# quadratic splines
bmat <- bsplines(xvec, iknots = c(-2, 0, 0.2), order = 3L)
bmat
plot(bmat) + ggplot2::ggtitle("Quadratic B-splines")



