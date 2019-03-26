library(seriation)


### Name: seriation_methods
### Title: Registry for Seriation Methods
### Aliases: registry_seriate set_seriation_method get_seriation_method
###   list_seriation_methods show_seriation_methods
### Keywords: misc

### ** Examples

## registry
registry_seriate

## convenience functions
show_seriation_methods("matrix")

list_seriation_methods("matrix")

get_seriation_method("matrix", "BEA")

## define a new method

## create a identity function which returns the identity order
seriation_method_identity <- function(x, control) {
   lapply(dim(x), seq)
}

## set new method
set_seriation_method("matrix", "identity", seriation_method_identity, 
    "Identity order")

set_seriation_method("array", "identity", seriation_method_identity, 
    "Identity order")

show_seriation_methods("matrix")

##use all criterion methods (including the new one)
seriate(matrix(1:12, ncol=3), "identity")



