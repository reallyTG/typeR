library(lambda.tools)


### Name: foldrange
### Title: Successively apply a function to a rolling range of a sequence
### Aliases: foldrange

### ** Examples

## Not run: 
##D # Mean of rolling means
##D z <- sapply(1:500, 
##D   function(x) foldrange(rnorm(50), 10, function(a,b) mean(a) + b) / 41)
## End(Not run)




