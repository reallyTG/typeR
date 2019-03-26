library(DTWBI)


### Name: compute.nmae
### Title: Normalized Mean Absolute Error (NMAE)
### Aliases: compute.nmae

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1] ; Y <- dataDTWBI[, 2]
compute.nmae(Y,X)

# If true values is a constant vector, NMAE = Inf.
# A warning is displayed and MAE is estimated instead of NMAE,
# unless true and imputed values are equal. In this case,
# by definition, NMAE = 0.
X <- rep(0, 10)
Y <- runif(10)
compute.nmae(Y,X) # MAE computed
Y <- X
compute.nmae(Y,X) # By definition, NMAE = 0



