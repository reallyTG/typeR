library(metaSEM)


### Name: rCor
### Title: Generate Sample/Population Correlation/Covariance Matrices
### Aliases: rCor rCorPop rCorSam
### Keywords: utilities

### ** Examples

Sigma <- matrix(c(1, .2, .3,
                  .2, 1, .4,
                  .3, .4, 1), ncol=3, nrow=3)
V <- diag(c(.1, .1, .1))

## Generate two population correlation matrices
Pop.corr <- rCorPop(Sigma, V, k=2)
Pop.corr
                  
summary(Pop.corr)
                  
## Generate two sample correlation matrices
rCorSam(Sigma=Pop.corr, n=c(10, 10))
                 
## The above code is the same as the following one
rCor(Sigma, V, n=c(10, 10))                  



