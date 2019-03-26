library(partitionComparison)


### Name: Partition-class
### Title: Simple S4 class to represent a partition of objects as vector of
###   class labels.
### Aliases: Partition-class Partition

### ** Examples

p <- new("Partition", c(0, 0, 1, 1, 1))
q <- new("Partition", c("a", "a", "b", "b", "b"))

## Not run: 
##D # This won't work:
##D new("Partition", c(list("a"), "a", "b", "b", "b"))
##D p[2] <- 2
## End(Not run)




