library(seriation)


### Name: get_order
### Title: Extracting Order Information from a Permutation Object
### Aliases: get_order get_order.integer get_order.hclust
###   get_order.ser_permutation_vector get_order.ser_permutation get_rank
###   get_permutation_matrix
### Keywords: manip

### ** Examples

## permutation_vector
o <- ser_permutation_vector(sample(10))
o

get_order(o)
get_rank(o)
get_permutation_matrix(o)

## permutation
o2 <- ser_permutation(o, sample(5))
o2

get_order(o2, dim = 2)
get_rank(o2, dim = 2)
get_permutation_matrix(o2, dim = 2)



