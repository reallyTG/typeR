library(DTWBI)


### Name: compute.sim
### Title: Similarity
### Aliases: compute.sim

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1] ; Y <- dataDTWBI[, 2]
compute.sim(Y,X)

# By definition, if true values is a constant vector
# and one or more imputed values are equal to the true values,
# similarity = 1.
X <- rep(2, 10)
Y <- X
compute.sim(Y,X)



