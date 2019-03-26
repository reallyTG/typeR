library(SDraw)


### Name: maxU
### Title: Maximum integer used in the BAS routines
### Aliases: maxU

### ** Examples

# A 2D random-start Halton sequence, length 10, bases c(2,3).
u <- c( floor((maxU()+1)*runif(1)), floor((maxU()+1)*runif(1)))
halt.pts <- halton(10,dim=2,start=u,bases=c(2,3))





