library(SuperPCA)


### Name: Parafac
### Title: Performs parafac factorization via ALS
### Aliases: Parafac

### ** Examples

A <- array(stats::rnorm(100*10*10), dim=c(100,10,10))
Parafac(A,4)



