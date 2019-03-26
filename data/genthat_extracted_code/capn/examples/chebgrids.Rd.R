library(capn)


### Name: chebgrids
### Title: Generating Chebyshev grids
### Aliases: chebgrids

### ** Examples

## Chebyshev grids with two-dimension
chebgrids(c(5,3), c(1,1), c(2,3))
# Returns the same results
chebgrids(c(5,3), c(1,1), c(2,3), rtype='list')
## Returns a matrix grids with the same domain
chebgrids(c(5,3), c(1,1), c(2,3), rtype='grid')
## Chebyshev grids with one-dimension
chebgrids(5,1,2)
chebnodegen(5,1,2)
## Chebyshev grids with three stock
chebgrids(c(3,4,5),c(1,1,1),c(2,3,4),rtype='grid')



