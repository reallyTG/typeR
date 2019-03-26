library(plot3D)


### Name: trans3D
### Title: Transformation of 3D elements
### Aliases: trans3D
### Keywords: hplot

### ** Examples

## ========================================================================
## 3-D mesh
## ========================================================================

 x <- y <- z <- c(-1 , 0, 1)

# plot a 3-D mesh
 (M <- mesh(x, y, z))

# plot result
 pmat <- scatter3D(M$x, M$y, M$z, pch = "+", cex = 3, colkey = FALSE)

# add line
 XY <- trans3D(x = c(-1, 1), y = c(-1, 1), z = c(-1, 1), pmat = pmat) 
 lines(XY, lwd = 2, col = "blue")

## ========================================================================
## Example 2
## ========================================================================

 pmat <- perspbox (z = diag(2))
 XY <- trans3D(x = runif(30), y = runif(30), z = runif(30), pmat = pmat) 
 polygon(XY, col = "darkblue")



