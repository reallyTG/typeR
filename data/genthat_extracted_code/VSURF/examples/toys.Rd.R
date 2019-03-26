library(VSURF)


### Name: toys
### Title: A simulated dataset called toys data
### Aliases: toys

### ** Examples

data(toys)
toys.rf <- randomForest::randomForest(toys$x, toys$y)
toys.rf

## Not run: 
##D # VSURF applied for toys data:
##D # (a few minutes to execute)
##D data(toys)
##D toys.vsurf <- VSURF(toys$x, toys$y)
##D toys.vsurf
## End(Not run)




