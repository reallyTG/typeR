library(objectProperties)


### Name: as.list-methods
### Title: Coercion to 'list'
### Aliases: as.list,-method as.list as.list as.list,PropertySet-method
###   show,PropertySet-method

### ** Examples
filt.gen <- setRefClass("Filter", properties(list(cutoff = "NonnegativeInteger",
weight = "PositiveInteger")),
contains = "PropertySet")
obj <- filt.gen$new(cutoff = NonnegativeInteger(0),
weight = PositiveInteger(1))
obj$properties()
as.list(obj)


