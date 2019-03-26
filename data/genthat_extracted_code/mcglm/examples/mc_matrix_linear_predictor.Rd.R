library(mcglm)


### Name: mc_matrix_linear_predictor
### Title: Matrix Linear Predictor
### Aliases: mc_matrix_linear_predictor

### ** Examples

require(Matrix)
Z0 <- Diagonal(5, 1)
Z1 <- Matrix(rep(1,5)%*%t(rep(1,5)))
Z <- list(Z0, Z1)
mc_matrix_linear_predictor(tau = c(1,0.8), Z = Z)



