library(nsprcomp)


### Name: nscumcomp
### Title: Non-Negative and Sparse Cumulative PCA
### Aliases: nscumcomp nscumcomp.default nscumcomp.formula

### ** Examples

if (requireNamespace("MASS", quietly = TRUE)) withAutoprint({

  set.seed(1)

  # Regular PCA, with tolerance set to return five PCs
  pca <- prcomp(MASS::Boston, tol = 0.35, scale. = TRUE)
  cumsum(pca$sdev[1:5])

  # Sparse cumulative PCA with five components and a total of 20 non-zero loadings.
  # The orthonormality penalty is set to a value which avoids co-linear principal
  # axes. Note that the non-zero loadings are not distributed uniformly over
  # the components.
  scc <- nscumcomp(MASS::Boston, ncomp = 5, k = 20, gamma = 1e4, scale. = TRUE)
  cumsum(scc$sdev)
  cardinality(scc$rotation)

  # Non-negative sparse cumulative PCA
  nscumcomp(MASS::Boston, ncomp = 5, nneg = TRUE, k = 20, gamma = 1e4, scale. = TRUE)
})



