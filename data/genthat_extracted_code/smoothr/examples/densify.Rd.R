library(smoothr)


### Name: densify
### Title: Densify spatial lines or polygons
### Aliases: densify

### ** Examples

library(sf)
l <- jagged_lines$geometry[[2]]
l_dense <- densify(l, n = 2)
plot(l, lwd = 5)
plot(l_dense, col = "red", lwd = 2, lty = 2, add = TRUE)
plot(l_dense %>% st_cast("MULTIPOINT"), col = "red", pch = 19,
     add = TRUE)



