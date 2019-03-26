library(plot3D)


### Name: Mesh generation
### Title: Rectangular grids.
### Aliases: mesh
### Keywords: hplot

### ** Examples


## ========================================================================
## 2-D mesh
## ========================================================================

 x <- c(-1 , 0, 1)
 y <- 1 : 4

# 2-D mesh
 (M <- mesh(x, y))

# calculate with this mesh
 V <- with (M, x/2 * sin(y))

# same as:
 V2 <- outer(x, y, FUN = function(x, y) x/2*sin(y))

## ========================================================================
## 3-D mesh
## ========================================================================

 x <- y <- z <- c(-1 , 0, 1)

# 3-D mesh
 (M <- mesh(x, y, z))

# calculate with 3-D mesh
 V <- with (M, x/2 * sin(y) *sqrt(z+2))
  
# plot result
 scatter3D(M$x, M$y, M$z, V, pch = "+", cex = 3, colkey = FALSE)



