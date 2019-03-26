library(slam)


### Name: apply
### Title: Apply Functions Over Sparse Matrix Margins
### Aliases: rowapply_simple_triplet_matrix colapply_simple_triplet_matrix
###   crossapply_simple_triplet_matrix tcrossapply_simple_triplet_matrix
### Keywords: algebra array

### ** Examples

## 
x <- matrix(c(1, 0, 0, 2, 1, 0), nrow = 3, 
    dimnames = list(1:3, LETTERS[1:2]))
x
s <- as.simple_triplet_matrix(x)
colapply_simple_triplet_matrix(s, FUN = var)
##
simplify2array(colapply_simple_triplet_matrix(s, identity))
##
crossapply_simple_triplet_matrix(s, FUN = var)



