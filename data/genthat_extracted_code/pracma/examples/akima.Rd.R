library(pracma)


### Name: akimaInterp
### Title: Univariate Akima Interpolation
### Aliases: akimaInterp
### Keywords: fitting

### ** Examples

x <- c( 0,  2,  3,  5,  6,  8,  9,   11, 12, 14, 15)
y <- c(10, 10, 10, 10, 10, 10, 10.5, 15, 50, 60, 85)
xs <- seq(12, 14, 0.5)          # 12.0 12.5     13.0     13.5     14.0
ys <- akimaInterp(x, y, xs)     # 50.0 54.57405 54.84360 55.19135 60.0
xs; ys

## Not run: 
##D plot(x, y, col="blue", main = "Akima Interpolation")
##D xi <- linspace(0,15,51)
##D yi <- akimaInterp(x, y, xi)
##D lines(xi, yi, col = "darkred")
##D grid()
## End(Not run)



