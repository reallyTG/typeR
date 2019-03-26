library(OpenRepGrid)


### Name: bind
### Title: Concatenate the constructs of two grids.
### Aliases: bind
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D    a <- randomGrid()
##D    b <- randomGrid()
##D    b@elements <- rev(a@elements)   # reverse elements
##D    bindConstructs(a, b)
##D  
##D    bindConstructs(a, b, m=F)       # no binding
## End(Not run)




