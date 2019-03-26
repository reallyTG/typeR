library(e1071)


### Name: interpolate
### Title: Interpolate Values of Array
### Aliases: interpolate
### Keywords: arith multivariate

### ** Examples

x <- seq(0,3,0.2)
z <- outer(x,x, function(x,y) sin(x*y))
dimnames(z) <- list(x,x)
sin(1.1*2.1)
interpolate(c(1.1, 2.1),z)



