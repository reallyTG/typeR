library(FSMUMI)


### Name: compute.sim
### Title: Similarity
### Aliases: compute.sim

### ** Examples

data(dataFSMUMI)
X <- dataFSMUMI[, 1] ; Y <- dataFSMUMI[, 2]
compute.sim(Y,X)

# By definition, if true values is a constant vector
# and one or more imputed values are equal to the true values,
# similarity = 1.
X <- rep(5, 100)
Y <- X
compute.sim(Y,X)



