library(rgl)


### Name: select3d
### Title: Select a rectangle in an RGL scene
### Aliases: select3d rgl.select3d
### Keywords: dynamic

### ** Examples


# Allow the user to select some points, and then redraw them
# in a different color

if (interactive()) {
 x <- rnorm(1000)
 y <- rnorm(1000)
 z <- rnorm(1000)
 open3d()
 points3d(x, y, z)
 f <- select3d()
 if (!is.null(f)) {
   keep <- f(x, y, z)
   rgl.pop()
   points3d(x[keep], y[keep], z[keep], color = 'red')
   points3d(x[!keep], y[!keep], z[!keep])
 }
}



