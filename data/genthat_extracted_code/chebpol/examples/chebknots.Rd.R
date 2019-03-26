library(chebpol)


### Name: chebknots
### Title: Create a Chebyshev-grid
### Aliases: chebknots

### ** Examples


## Standard knots for degree 3
chebknots(4)
## Knots in the interval [2,3] for degree 3
chebknots(4,interval=c(2,3))
## Multivariate knots
chebknots(c(x=3,y=4,z=3))
## Multivariate grid
## Not run: 
##D expand.grid(chebknots(c(x=3,y=4,z=5), list(c(1,3), c(4,6), c(800,900))))
## End(Not run)




