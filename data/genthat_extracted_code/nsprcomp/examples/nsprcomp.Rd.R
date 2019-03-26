library(nsprcomp)


### Name: nsprcomp
### Title: Non-Negative and Sparse PCA
### Aliases: nsprcomp nsprcomp.default nsprcomp.formula

### ** Examples

if (requireNamespace("MASS", quietly = TRUE)) withAutoprint({
  set.seed(1)

  # Regular PCA, with the tolerance set to return five PCs
  prcomp(MASS::Boston, tol = 0.36, scale. = TRUE)

  # Sparse PCA with different cardinalities per component. The number of components
  # is derived from the length of vector k.
  nsprcomp(MASS::Boston, k = c(13, 7, 5, 5, 5), scale. = TRUE)

  # Non-negative sparse PCA with four components. Note that the principal axes
  # naturally have a high degree of orthogonality, because each component
  # maximizes the additional variance not already explained.
  set.seed(1)
  nsprcomp(MASS::Boston, k = c(7, 5, 2, 2), nneg = TRUE, scale. = TRUE)

  # The optimization can get stuck in local optima. Increase the number of
  # random restarts or the number of power iterations to likely obtain decreasing
  # standard deviations.
  set.seed(1)
  (nspc <- nsprcomp(MASS::Boston, k = c(7, 5, 2, 2), nneg = TRUE, scale. = TRUE,
                    nrestart = 10, em_tol = 1e-4, verbosity = 1))

  # continue the computation of components from a partial model
  nsprcomp(MASS::Boston, k = 3, ncomp = 5, nneg = TRUE, scale. = TRUE, partial_model = nspc)

  # The reconstruction error for each sample can be influenced using the
  # weighting vector omega. To reconstruct the data, the generalized
  # inverse of the pseudo-rotation matrix has to be used, because the constrained
  # principal axes are in general not pairwise orthogonal.
  set.seed(1)
  X <- matrix(runif(5*10), 5)
  nspc <- nsprcomp(X, omega = c(5, 1, 1, 1, 5), ncomp = 2, nneg = TRUE)
  X_hat <- predict(nspc)%*%MASS::ginv(nspc$rotation) + matrix(1,5,1)%*%nspc$center
  rowSums((X - X_hat)^2)
})



