library(paleomorph)


### Name: dotcorr
### Title: Calculate 3D vector correlation matrix using the congruence
###   coefficient. Skips any missing values in computation of correlation
###   matrix
### Aliases: dotcorr

### ** Examples

A <- array(rnorm(4 * 2 * 3), dim = c(2, 3, 4)) 
A.corr <- dotcorr(A)




