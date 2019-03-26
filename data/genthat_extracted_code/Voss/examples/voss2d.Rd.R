library(Voss)


### Name: voss2d
### Title: Fractal Brownian function on 2D grid with a classic Voss
###   algorithm
### Aliases: voss2d

### ** Examples

set.seed(20120522)
voss <- voss2d()
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a parameter H=0.5")
contour(voss, levels=0, add=TRUE)



