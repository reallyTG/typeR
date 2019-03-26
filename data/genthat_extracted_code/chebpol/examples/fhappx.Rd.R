library(chebpol)


### Name: fhappx
### Title: Floater-Hormann interpolation on a grid
### Aliases: fhappx
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D ## evenly spaced grid-points
##D su <- seq(0,1,length.out=10)
##D ## irregularly spaced grid-points
##D s <- su^3
##D ## create approximation on the irregularly spaced grid
##D fh1 <- fhappx(exp,grid=list(s))
##D ## test it
##D fh1(su) - exp(su)
##D 
##D ## two dimensional approximation
##D f <- function(x) exp(sum(x^2))
##D grid <- list(s,su)
##D 
##D fh2 <- fhappx(evalongrid(f,grid=grid),grid=grid)
##D # an equivalent would be fh2 <- fhappx(f,grid)
##D 
##D a <- runif(2); fh2(a); f(a)
## End(Not run)



