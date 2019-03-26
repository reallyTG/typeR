library(BosonSampling)


### Name: Permanent-functions
### Title: Functions for evaluating matrix permanents
### Aliases: Permanent-functions cxPerm rePerm cxPermMinors

### ** Examples

  set.seed(7)
  n <- 20
  A <- randomUnitary(n)
  cxPerm(A)
  #
  B <- Re(A)
  rePerm(B)
  #
  C <- A[,-n]
  v <- cxPermMinors(C)
  #
  # Check Laplace expansion by sub-permanents
  c(cxPerm(A),sum(v*A[,n]))



