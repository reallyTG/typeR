library(smoothr)


### Name: smooth_densify
### Title: Densify lines or polygons
### Aliases: smooth_densify

### ** Examples

# smooth_densify works on matrices of coordinates
# use the matrix of coordinates defining a line as an example
m <- jagged_lines$geometry[[2]][]
m_dense <- smooth_densify(m, n = 5)
class(m)
class(m_dense)
plot(m, type = "b", pch = 19, cex = 1.5, axes = FALSE, xlab = NA, ylab = NA)
points(m_dense, col = "red", pch = 19, cex = 0.5)

# max_distance can be used to ensure vertices are at most a given dist apart
m_md <- smooth_densify(m, max_distance = 0.05)
plot(m, type = "b", pch = 19, cex = 1.5, axes = FALSE, xlab = NA, ylab = NA)
points(m_md, col = "red", pch = 19, cex = 0.5)

# smooth is a wrapper for smooth_densify that works on spatial features
library(sf)
l <- jagged_lines$geometry[[2]]
l_dense <- smooth(l, method = "densify", n = 2)
class(l)
class(l_dense)
plot(l, lwd = 5)
plot(l_dense, col = "red", lwd = 2, lty = 2, add = TRUE)
plot(l_dense %>% st_cast("MULTIPOINT"), col = "red", pch = 19,
     add = TRUE)



