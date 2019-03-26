library(chebpol)


### Name: mlappx
### Title: Multilinear interpolation on a grid
### Aliases: mlappx mlappxf
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D ## evenly spaced grid-points
##D su <- seq(0,1,length.out=10)
##D ## irregularly spaced grid-points
##D s <- su^3
##D ## create approximation on the irregularly spaced grid
##D ml1 <- Vectorize(mlappx(exp,list(s)))
##D ## test it, since exp is convex, the linear approximation lies above
##D ## the exp between the grid points
##D ml1(su) - exp(su)
##D 
##D ## multi linear approx
##D f <- function(x) exp(sum(x^2))
##D grid <- list(s,su)
##D 
##D ml2 <- mlappx(evalongrid(f,grid=grid),grid)
##D # an equivalent would be ml2 <- mlappx(f,grid)
##D 
##D a <- runif(2); ml2(a); f(a)
##D # we also get an approximation outside of the domain, of disputable quality
##D ml2(c(1,2)); f(c(1,2))
## End(Not run)



