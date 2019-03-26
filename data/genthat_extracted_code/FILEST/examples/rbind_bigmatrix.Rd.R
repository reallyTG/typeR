library(FILEST)


### Name: rbind_bigmatrix
### Title: Combind two matrices by row for big data, internally used for
###   parallelization
### Aliases: rbind_bigmatrix

### ** Examples

X <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
Y <- matrix(c(2,1,1,0,1,0,0,1,1,2,2,0,0,1,1,0),ncol=4)
Z <- rbind_bigmatrix(X,Y)
print(Z)



