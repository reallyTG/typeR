library(pracma)


### Name: interp2
### Title: Two-dimensional Data Interpolation
### Aliases: interp2
### Keywords: math

### ** Examples

## Not run: 
##D     x <- linspace(-1, 1, 11)
##D     y <- linspace(-1, 1, 11)
##D     mgrid <- meshgrid(x, y)
##D     Z <- mgrid$X^2 + mgrid$Y^2
##D     xp <- yp <- linspace(-1, 1, 101)
##D 
##D     method <- "linear"
##D     zp <- interp2(x, y, Z, xp, yp, method)
##D     plot(xp, zp, type = "l", col = "blue")
##D 
##D     method = "nearest"
##D     zp <- interp2(x, y, Z, xp, yp, method)
##D     lines(xp, zp, col = "red")
##D     grid()
## End(Not run)



