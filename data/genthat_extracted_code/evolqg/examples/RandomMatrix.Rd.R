library(evolqg)


### Name: RandomMatrix
### Title: Random matrices for tests
### Aliases: RandomMatrix
### Keywords: randommatrices

### ** Examples

#single 10x10 correlation matrix
RandomMatrix(10)

#single 5x5 covariance matrix, variances between 3 and 4
RandomMatrix(5, 1, 3, 4)

#two 3x3 covariance matrices, with shared variances
RandomMatrix(3, 2, variance= c(3, 4, 5))

#large 10x10 matrix list, with wide range of variances
RandomMatrix(10, 100, 1, 300)



