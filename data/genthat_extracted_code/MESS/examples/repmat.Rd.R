library(MESS)


### Name: repmat
### Title: Fast replication of a matrix
### Aliases: repmat

### ** Examples


m <- matrix(1:6, ncol=3)
repmat(m, 2)     # Stack two copies of m on top of each other
repmat(m, 2, 3)  # Replicate m with two copies on top and three copies side-by-side 




