library(meta4diag)


### Name: forest
### Title: Forest plot.
### Aliases: forest forest.grid forest.grid.meta4diag forest.meta4diag

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   res <- meta4diag(data = Catheter)
##D   forest(res, accuracy.type = "sens")
##D }
## End(Not run)



