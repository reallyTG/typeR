library(seriation)


### Name: criterion_methods
### Title: Registry for Criterion Methods
### Aliases: registry_criterion set_criterion_method get_criterion_method
###   list_criterion_methods show_criterion_methods
### Keywords: misc

### ** Examples

## the registry
registry_criterion

## use the convenience functions
list_criterion_methods("dist")

show_criterion_methods("dist")

get_criterion_method("dist", "AR_d")

## define a new method

## a function that return sum of the diagonal elements
criterion_method_matrix_foo <- function(x, order, ...) {
if(!is.null(order)) x <- permute(x,order)
    sum(diag(x))
}

## set new method
set_criterion_method("matrix", "foo", criterion_method_matrix_foo, 
    "foo: a useless demo criterion", FALSE)

list_criterion_methods("matrix")

##use all criterion methods (including the new one)
criterion(matrix(1:9, ncol=3))



