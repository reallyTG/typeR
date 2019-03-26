library(spatstat)


### Name: rpoispp
### Title: Generate Poisson Point Pattern
### Aliases: rpoispp
### Keywords: spatial datagen

### ** Examples

 # uniform Poisson process with intensity 100 in the unit square
 pp <- rpoispp(100)
 
 # uniform Poisson process with intensity 1 in a 10 x 10 square
 pp <- rpoispp(1, win=owin(c(0,10),c(0,10)))
 # plots should look similar !
 
 # inhomogeneous Poisson process in unit square
 # with intensity lambda(x,y) = 100 * exp(-3*x)
 # Intensity is bounded by 100
 pp <- rpoispp(function(x,y) {100 * exp(-3*x)}, 100)

 # How to tune the coefficient of x
 lamb <- function(x,y,a) { 100 * exp( - a * x)}
 pp <- rpoispp(lamb, 100, a=3)

 # pixel image
 Z <- as.im(function(x,y){100 * sqrt(x+y)}, unit.square())
 pp <- rpoispp(Z)

 # randomising an existing point pattern
 rpoispp(intensity(cells), win=Window(cells))
 rpoispp(ex=cells)



