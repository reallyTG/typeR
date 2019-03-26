library(seriation)


### Name: permutation_matrix
### Title: Conversion Between Permutation Vector and Permutation Matrix
### Aliases: permutation_matrix2vector permutation_vector2matrix
### Keywords: manip

### ** Examples

## create a random permutation vector
pv <- sample(1:5)
pv
  
## convert into a permutation matrix
pm <- permutation_vector2matrix(pv)
pm
  
## convert back  
permutation_matrix2vector(pm)



