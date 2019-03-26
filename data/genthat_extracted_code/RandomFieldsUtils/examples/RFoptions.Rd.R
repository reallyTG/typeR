library(RandomFieldsUtils)


### Name: RFoptions
### Title: Setting control arguments
### Aliases: RFoptions PIVOT_UNDEFINED PIVOT_NONE PIVOT_AUTO PIVOT_DO
###   PIVOT_IDX PIVOTSPARSE_MMD PIVOTSPARSE_RCM
### Keywords: spatial

### ** Examples


if (FALSE) {
  n <- 500
  M <- matrix(rnorm(n * n), nc=n)
  M <- M %*% t(M)
  system.time(chol(M))
  system.time(cholesky(M))
  RFoptions(cores = 2)
  system.time(cholesky(M))
}




