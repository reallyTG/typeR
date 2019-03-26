library(smoothr)


### Name: smooth_chaikin
### Title: Chaikin's corner cutting algorithm
### Aliases: smooth_chaikin

### ** Examples

# smooth_chaikin works on matrices of coordinates
# use the matrix of coordinates defining a polygon as an example
m <- jagged_polygons$geometry[[2]][[1]]
m_smooth <- smooth_chaikin(m, wrap = TRUE)
class(m)
class(m_smooth)
plot(m, type = "l", axes = FALSE, xlab = NA, ylab = NA)
lines(m_smooth, col = "red")

# smooth is a wrapper for smooth_chaikin that works on spatial features
library(sf)
p <- jagged_polygons$geometry[[2]]
p_smooth <- smooth(p, method = "chaikin")
class(p)
class(p_smooth)
plot(p)
plot(p_smooth, border = "red", add = TRUE)



