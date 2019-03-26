context('matrix2Rmatrix')

# Roundtrip test of matrix
m <- matrix(c(1, 2, 3, 4), ncol=2, nrow=2)
dimnames(m) <- list(c("CL", "V"), c("CL", "V"))

mle <- so_MLE$new()
mle$CovarianceMatrix <- m

new_mle <-mle$CovarianceMatrix

expect_identical(new_mle, m)