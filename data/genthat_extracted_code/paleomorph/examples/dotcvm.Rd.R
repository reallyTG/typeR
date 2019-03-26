library(paleomorph)


### Name: dotcvm
### Title: Calculate 2d or 3D covariance matrix using unscaled congruence
###   coefficient.  Skips any missing values in computation of covariance
###   matrix
### Aliases: dotcvm

### ** Examples

A <- array(rnorm(4 * 2 * 3), dim = c(2, 3, 4)) 
A.cvm <- dotcvm(A)



