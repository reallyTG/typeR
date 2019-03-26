library(capn)


### Name: unigrids
### Title: Generating unifrom grids
### Aliases: unigrids

### ** Examples

## Uniform grids with two-dimension
unigrids(c(5,3), c(1,1), c(2,3))
## Returns the same results
unigrids(c(5,3), c(1,1), c(2,3), rtype='list')
## Returns a matrix grids with the same domain
unigrids(c(5,3), c(1,1), c(2,3), rtype='grid')
## Uniform grid with one-dimension
unigrids(5,1,2)
## Uniform grids with three stock
unigrids(c(3,4,5),c(1,1,1),c(2,3,4),rtype='grid')



