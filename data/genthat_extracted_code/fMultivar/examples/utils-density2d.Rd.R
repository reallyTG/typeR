library(fMultivar)


### Name: utils-density2d
### Title: Bivariate Density Tools
### Aliases: density2d hist2d
### Keywords: math

### ** Examples

## hist2d - 
   # Normal Random Numbers:
   set.seed(4711)
   X <- rnorm2d(40000)
   # 2D Histogram Plot:
   Z <- hist2d(X)
   image(Z)
   contour(Z, add=TRUE)



