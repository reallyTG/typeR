library(fda)


### Name: vec2Lfd
### Title: Make a Linear Differential Operator Object from a Vector
### Aliases: vec2Lfd
### Keywords: smooth

### ** Examples

#  define the harmonic acceleration operator used in the
#  analysis of the daily temperature data
Lcoef <- c(0,(2*pi/365)^2,0)
harmaccelLfd <- vec2Lfd(Lcoef, c(0,365))

hmat <- vec2Lfd(matrix(Lcoef, 1), c(0, 365))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(harmaccelLfd, hmat)
## Don't show: 
)
## End(Don't show)




