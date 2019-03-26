library(Polychrome)


### Name: getLUV
### Title: Get the L*u*v* coordinates of the colors
### Aliases: getLUV
### Keywords: color

### ** Examples

data(alphabet)
luv <- getLUV(alphabet)
scatterplot3d::scatterplot3d(luv$coords, color = luv$cset,
    pch = 16, cex.symbol = 3)
## Not run: 
##D library(rgl)
##D x <- luv$coords
##D cset <- luv$cset
##D open3d(windowRect=c(40, 40, 840, 840))
##D plot3d(x, main="Alphabet Colors")
##D spheres3d(x, radius=10, col=cset, shininess=100)
## End(Not run)



