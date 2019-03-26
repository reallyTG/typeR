library(greta)


### Name: structures
### Title: create data greta arrays
### Aliases: structures zeros ones greta_array

### ** Examples

## Not run: 
##D 
##D # a 3 row, 4 column greta array of 0s
##D z <- zeros(3, 4)
##D 
##D # a 3x3x3 greta array of 1s
##D z <- ones(3, 3, 3)
##D 
##D # a 2x4 greta array filled with pi
##D z <- greta_array(pi, dim = c(2, 4))
##D 
##D # a 3x3x3 greta array filled with 1, 2, and 3
##D z <- greta_array(1:3, dim = c(3, 3, 3))
## End(Not run)



