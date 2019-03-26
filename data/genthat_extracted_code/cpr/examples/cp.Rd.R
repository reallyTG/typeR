library(cpr)


### Name: cp
### Title: Control Polygons
### Aliases: cp cp.cpr_bs cp.formula print.cpr_cp summary.cpr_cp
###   plot.cpr_cp

### ** Examples


# Support
xvec <- seq(0, 6, length = 500)

# Define the basis matrix
bmat1 <- cpr::bsplines(x = xvec, iknots = c(1, 1.5, 2.3, 4, 4.5))
bmat2 <- cpr::bsplines(x = xvec)

# Define the control vertices ordinates
theta1 <- c(1, 0, 3.5, 4.2, 3.7, -0.5, -0.7, 2, 1.5)
theta2 <- c(1, 3.4, -2, 1.7)

# build the two control polygons
cp1 <- cp(bmat1, theta1)
cp2 <- cp(bmat2, theta2)

# black and white plot
plot(cp1)
plot(cp1, show_spline = TRUE)

# multiple control polygons
plot(cp1, cp2, show_spline = TRUE)
plot(cp1, cp2, color = TRUE)
plot(cp1, cp2, show_spline = TRUE, color = TRUE)

# via formula
dat <- dplyr::data_frame(x = xvec, y = sin((x - 2)/pi) + 1.4 * cos(x/pi))
cp3 <- cp(y ~ cpr::bsplines(x) + 0, data = dat)

# plot the control polygon, spline and target data.
plot(cp3, show_spline = TRUE) + 
  ggplot2::geom_line(mapping = ggplot2::aes_string(x = "x", y = "y"), 
                     data = dat, linetype = 2, color = "red")




