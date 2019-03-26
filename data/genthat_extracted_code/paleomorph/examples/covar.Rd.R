library(paleomorph)


### Name: covar
### Title: Calculate covariance matrix between individual landmark
###   coordinates
### Aliases: covar

### ** Examples

A <- array(rnorm(4 * 2 * 3), dim = c(2, 3, 4)) 
A.cov <- covar(A)



