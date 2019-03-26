library(bliss)


### Name: corr_matrix
### Title: corr_matrix
### Aliases: corr_matrix

### ** Examples

### Test 1 : weak autocorrelation
ksi     <- 1
diagVar <- abs(rnorm(100,50,5))
Sigma   <- corr_matrix(diagVar,ksi^2)
persp(Sigma)
### Test 2 : strong autocorrelation
ksi     <- 0.2
diagVar <- abs(rnorm(100,50,5))
Sigma   <- corr_matrix(diagVar,ksi^2)
persp(Sigma)



