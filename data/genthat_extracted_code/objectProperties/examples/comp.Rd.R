library(objectProperties)


### Name: comp
### Title: Bounded types for properties
### Aliases: PositiveInteger PositiveInteger PositiveInteger-class
###   NonnegativeInteger NonnegativeInteger-class NegativeInteger
###   NegativeInteger-class NonpositiveInteger NonpositiveInteger-class

### ** Examples
## Constructors
require(objectProperties)
obj <- PositiveInteger(1)
obj <- NonnegativeInteger(0)
obj <- NegativeInteger(-1)
obj <- NonpositiveInteger(0)
## setting as properties
filt.gen <- setRefClass("Filter",
properties(list(cutoff = "NonnegativeInteger",
weight = "PositiveInteger")), contains = "PropertySet")
## new property instance
obj <- filt.gen$new(cutoff = 0, weight = 1)
obj$properties()
as.list(obj)
## get the value
obj$cutoff
## set the value
obj$cutoff <- 30
## the class doesn't change
## if you pass a value which out of boundary, it will throw an error message
obj$cutoff
class(obj$cutoff)


