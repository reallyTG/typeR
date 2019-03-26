library(turner)


### Name: factor_to_dummy
### Title: Create a dummy matrix from the elements in a factor
### Aliases: factor_to_dummy

### ** Examples

# let's say you have a list like this
some_factor = iris$Species[c(1:3,51:53,101:103)]

# get dummy matrix
factor_to_dummy(some_factor)



