library(arrayhelpers)


### Name: array2vec
### Title: Converting array and vector Indices Calculate the vector index
###   from array indices, and vice versa.
### Aliases: array2vec vec2array
### Keywords: array

### ** Examples


arr <- array (rnorm (24), dim = 2 : 4)
arr

v <- matrix(c(2, 2, 2), nrow = 1)
i <- array2vec (v, dim = dim (arr))
i
arr[v]
arr[i]

arr[c(2, 2, 2)] ## indexing with a vector
arr[2]

 
i <- 14
v <- vec2array (i, dim = dim (arr))
v
arr [v]
arr [i]




