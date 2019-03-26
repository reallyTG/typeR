library(tcgsaseq)


### Name: deseq_fn
### Title: Computes gene-wise p-values from DESeq2 method using
###   observation-wise dispersion estimates
### Aliases: deseq_fn
### Keywords: internal

### ** Examples

## Not run: 
##D #rm(list=ls())
##D set.seed(123)
##D 
##D ##generate some fake data
##D ########################
##D n <- 100
##D r <- 12
##D phi <- matrix(rep(1:3), 4, ncol=1, nrow=r)
##D sigma <- 0.4
##D b0 <- 1
##D 
##D #under the null:
##D b1 <- 0
##D #under the alternative:
##D b1 <- 0.7
##D y.tilde <- b0 + b1*phi + rnorm(r, sd = sigma)
##D y <- floor(exp(t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
##D       matrix(rep(y.tilde, n), ncol=n, nrow=r))))
##D x <- matrix(1:2, ncol=1, nrow=r/2)
##D indiv=rep(1:4, each=3)
##D 
##D #run test
##D temp <- deseq_fn(y, x, phi, indiv)
## End(Not run)



