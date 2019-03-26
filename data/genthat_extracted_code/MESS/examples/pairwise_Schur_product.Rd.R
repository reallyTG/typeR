library(MESS)


### Name: pairwise_Schur_product
### Title: Compute Schur products (element-wise) of all pairwise
###   combinations of columns in matrix
### Aliases: pairwise_Schur_product

### ** Examples


X <- cbind(rep(1, 4), 1:4, 4:1)
pairwise_Schur_product(X)
pairwise_Schur_product(X, self=TRUE)




