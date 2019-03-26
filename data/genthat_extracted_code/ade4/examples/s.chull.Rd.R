library(ade4)


### Name: s.chull
### Title: Plot of the factorial maps with polygons of contour by level of
###   a factor
### Aliases: s.chull
### Keywords: multivariate hplot

### ** Examples

xy <- cbind.data.frame(x = runif(200,-1,1), y = runif(200,-1,1))
posi <- factor(xy$x > 0) : factor(xy$y > 0)
coul <- c("black", "red", "green", "blue")

if(adegraphicsLoaded()) {
  s.class(xy, posi, ppoi.cex = 1.5, chullSize = c(0.25, 0.5, 0.75, 1), ellipseSize = 0, 
    starSize = 0, ppoly = list(col = "white", border = coul))
} else {
  s.chull(xy, posi, cpoi = 1.5, col = coul)
}


