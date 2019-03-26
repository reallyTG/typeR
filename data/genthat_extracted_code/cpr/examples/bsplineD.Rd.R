library(cpr)


### Name: bsplineD
### Title: B-spline Derivatives
### Aliases: bsplineD

### ** Examples


set.seed(42)

xvec <- seq(0.1, 9.9, length = 1000)
iknots <- sort(runif(rpois(1, 3), 1, 9))
bknots <- c(0, 10)

# basis matrix and the first and second derivatives thereof, for cubic (order =
# 4) b-splines
bmat  <- bsplines(xvec, iknots, bknots = bknots)
bmat1 <- bsplineD(xvec, iknots, bknots = bknots, derivative = 1)
bmat2 <- bsplineD(xvec, iknots, bknots = bknots, derivative = 2)

# control polygon ordinates
theta <- runif(length(iknots) + 4L, -5, 5)

# plot data
plot_data <-
  dplyr::data_frame(x = xvec,
                    Spline = as.numeric(bmat %*% theta),
                    "First Derivative" = as.numeric(bmat1 %*% theta),
                    "Second Derivative" = as.numeric(bmat2 %*% theta))
plot_data <- tidyr::gather(plot_data, key = key, value = value, -x)

ggplot2::ggplot(plot_data) +
ggplot2::aes(x = x, y = value, color = key) +
ggplot2::geom_line() +
ggplot2::geom_hline(yintercept = 0) +
ggplot2::geom_vline(xintercept = iknots, linetype = 3)




