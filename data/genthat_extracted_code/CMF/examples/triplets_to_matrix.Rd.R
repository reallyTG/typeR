library(CMF)


### Name: triplets_to_matrix
### Title: Conversion from triplet/coordinate format to matrix
### Aliases: triplets_to_matrix

### ** Examples

x <- matrix(c(1,2,NA,NA,5,6),nrow=3)
triplet <- matrix_to_triplets(x)
print(triplet)
xnew <- triplets_to_matrix(triplet)
print(xnew)



