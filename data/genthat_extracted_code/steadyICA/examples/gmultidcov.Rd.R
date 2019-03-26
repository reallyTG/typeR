library(steadyICA)


### Name: gmultidcov
### Title: Symmetric multivariate distance covariance for grouped
###   components
### Aliases: gmultidcov
### Keywords: distance covariance dcov

### ** Examples


library(steadyICA)
S = matrix(rnorm(300),ncol=3)
group = c(1,2,2)
gmultidcov(S,group,TRUE) # close to zero
gmultidcov(S,group,FALSE) # sill close to zero

Sigma = matrix(c(1,0.7,0,0.7,1,-0.2,0,-0.2,1),ncol=3)
X = MASS::mvrnorm(100,rep(0,3),Sigma)
gmultidcov(X,group,TRUE) # further from zero
gmultidcov(X,group,FALSE) # further from zero




