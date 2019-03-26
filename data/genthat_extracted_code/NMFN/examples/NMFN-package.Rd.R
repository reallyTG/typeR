library(NMFN)


### Name: NMFN-package
### Title: Non-negative Matrix Factorization - Overview
### Aliases: NMFN-package NMFN
### Keywords: non-negative matrix factorization, multiplicative update,
###   alternating least squares, multinomial

### ** Examples


X <- matrix(1:12,3,4) 
z.mm   <- nnmf(X,3)             # 3 factors via multiplicative update
z.als  <- nnmf(X,3,'nnmf_als')  # 3 factors via alternating least square
z.prob <- nnmf(X,3,'nnmf_prob') # 3 factors via multinomial




