library(quhomology)


### Name: smith
### Title: Smith Normal Form of a matrix.
### Aliases: smith

### ** Examples

test_mat <- matrix(c(2,4,4, -6,6,12, 10,-4,-16), nrow=3, ncol=3, byrow=TRUE)
smith(test_mat)
#######
#output:

#  2    0    0
#  0    6    0
#  0    0   12



