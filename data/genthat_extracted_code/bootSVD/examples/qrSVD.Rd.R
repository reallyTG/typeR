library(bootSVD)


### Name: qrSVD
### Title: Wrapper for 'svd', which uses random preconditioning to restart
###   when svd fails to converge
### Aliases: qrSVD

### ** Examples

x <-matrix(rnorm(3*5),nrow=3,ncol=5)
svdx <- qrSVD(x)
svdx



