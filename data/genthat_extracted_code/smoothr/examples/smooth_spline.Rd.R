library(smoothr)


### Name: smooth_spline
### Title: Spline interpolation
### Aliases: smooth_spline

### ** Examples

# smooth_spline works on matrices of coordinates
# use the matrix of coordinates defining a polygon as an example
m <- jagged_polygons$geometry[[2]][[1]]
m_smooth <- smooth_spline(m, wrap = TRUE)
class(m)
class(m_smooth)
plot(m_smooth, type = "l", col = "red", axes = FALSE, xlab = NA, ylab = NA)
lines(m, col = "black")

# smooth is a wrapper for smooth_spline that works on spatial features
library(sf)
p <- jagged_polygons$geometry[[2]]
p_smooth <- smooth(p, method = "spline")
class(p)
class(p_smooth)
plot(p_smooth, border = "red")
plot(p, add = TRUE)



