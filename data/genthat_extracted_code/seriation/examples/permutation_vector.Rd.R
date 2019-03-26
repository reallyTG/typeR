library(seriation)


### Name: permutation_vector
### Title: Class ser_permutation_vector - A Single Permutation Vector for
###   Seriation
### Aliases: ser_permutation_vector permutation_vector
###   print.ser_permutation_vector rev.ser_permutation_vector get_method
###   length.ser_permutation_vector
### Keywords: classes

### ** Examples

p <- ser_permutation_vector(sample(10), "random")
p

## some methods
length(p)
get_method(p)
get_order(p)
get_rank(p)
get_permutation_matrix(p)

r <- rev(p)
r
get_order(r)

## create a indentity permutation vector (with unknown length)
ip <- ser_permutation_vector(NA)
ip 



