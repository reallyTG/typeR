library(coda.base)


### Name: coordinates
### Title: Get coordinates from compositions w.r.t. an specific basis
### Aliases: coordinates

### ** Examples

coordinates(c(1,2,3,4,5))
# basis is shown if 'coda.base.basis' option is set to TRUE
options('coda.base.basis' = TRUE)
coordinates(c(1,2,3,4,5))
# Setting sparse_basi to TRUE can improve performance if log-ratio basis is sparse.
N = 100
K = 1000
X = matrix(exp(rnorm(N*K)), nrow=N, ncol=K)
system.time(coordinates(X, alr_basis(K), sparse_basis = FALSE))
system.time(coordinates(X, alr_basis(K), sparse_basis = TRUE))
system.time(coordinates(X, 'alr'))



