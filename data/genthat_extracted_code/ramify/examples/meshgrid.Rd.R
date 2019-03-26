library(ramify)


### Name: meshgrid
### Title: Rectangular 2-D Grid
### Aliases: meshgrid

### ** Examples

mg <- meshgrid(linspace(-4*pi, 4*pi, 27))  # list of input matrices
z <- cos(mg[[1]]^2 + mg[[2]]^2) * exp(-sqrt(mg[[1]]^2 + mg[[2]]^2)/6)
image(z, axes = FALSE)  # color image
contour(z, add = TRUE, drawlabels = FALSE)  # add contour lines



