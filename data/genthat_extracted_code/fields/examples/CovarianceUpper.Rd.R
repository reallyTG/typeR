library(fields)


### Name: CovarianceUpper
### Title: Evaluate covariance over upper triangle of distance matrix
### Aliases: ExponentialUpper
### Keywords: covariance

### ** Examples

set.seed(123)

#make distance matrix using the random locations
coords = matrix(runif(10), ncol=2)
distMat = rdist(coords)

#compute covariance matrix, but only over the upper triangle
upperCov = ExponentialUpper(distMat, range=.1)

print(distMat)
print(upperCov)



