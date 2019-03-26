library(protr)


### Name: acc
### Title: Auto Cross Covariance (ACC) for Generating Scales-Based
###   Descriptors of the Same Length
### Aliases: acc
### Keywords: acc covariance

### ** Examples

p = 8    # p is the scales number
n = 200  # n is the amino acid number
lag = 7  # the lag paramter
mat = matrix(rnorm(p * n), nrow = p, ncol = n)
acc(mat, lag)



