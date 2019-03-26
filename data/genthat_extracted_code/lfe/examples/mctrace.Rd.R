library(lfe)


### Name: mctrace
### Title: Compute trace of a large matrix by sample means
### Aliases: mctrace

### ** Examples


  A <- matrix(rnorm(25),5)
  fun <- function(x) A %*% x
  sum(diag(A))
  sum(eigen(A,only.values=TRUE)$values)
  # mctrace is not really useful for small problems.
  mctrace(fun,ncol(A),tol=0.05)
  # try a larger problem (3000x3000):
  f1 <- factor(sample(1500,3000,replace=TRUE))
  f2 <- factor(sample(1500,3000,replace=TRUE))
  fl <- list(f1,f2)
  mctrace(fl,tol=-5)
  # exact:
  length(f1) - nlevels(f1) - nlevels(f2) + nlevels(compfactor(fl))




