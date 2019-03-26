library(OpenRepGrid)


### Name: apply_pb
### Title: apply with a progress bar
### Aliases: apply_pb
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D    apply_pb(anscombe, 2, sd, na.rm=TRUE)
##D 
##D    # larger dataset
##D    df <- data.frame(rnorm(30000), rnorm(30000))
##D    head(apply_pb(df, 1, sd))
##D 
##D    # performance comparison
##D    df <- data.frame(rnorm(90000), rnorm(90000))
##D    system.time(apply(df, 1, sd))
##D    system.time(apply_pb(df, 1, sd))
##D 
## End(Not run)




