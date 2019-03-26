library(sets)


### Name: outer
### Title: Outer Product of Sets (Tuples)
### Aliases: set_outer gset_outer cset_outer tuple_outer
### Keywords: math

### ** Examples

set_outer(set(1,2), set(1,2,3), "/")
X <- set_outer(set(1,2), set(1,2,3), pair)
X[[1,1]]
Y <- set_outer(set(1,2), set(1,2,3), set)
Y[[1,1]]
set_outer(2 ^ set(1,2,3), set_is_subset)

tuple_outer(pair(1,2), triple(1,2,3))
tuple_outer(1:5, 1:4, "^")



