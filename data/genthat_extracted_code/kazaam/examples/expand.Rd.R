library(kazaam)


### Name: expand
### Title: expand
### Aliases: expand

### ** Examples

## Not run: 
##D library(kazaam)
##D if (comm.rank() == 0){
##D   x = matrix(runif(30), 10, 3)
##D } else {
##D   x = NULL
##D }
##D 
##D dx = expand(x)
##D dx
##D 
##D finalize()
## End(Not run)




