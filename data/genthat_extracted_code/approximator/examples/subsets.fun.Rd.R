library(approximator)


### Name: subsets.fun
### Title: Generate and test subsets
### Aliases: is.nested is.strict subsets.fun
### Keywords: array

### ** Examples

is.nested(subsets.fun(20))  # Should be TRUE

data(toyapps)
stopifnot(is.nested(subsets.toy))



