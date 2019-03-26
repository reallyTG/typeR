library(ThreeWay)


### Name: normvari
### Title: Normalized varimax rotation
### Aliases: normvari
### Keywords: array multivariate algebra

### ** Examples

X <- matrix(rnorm(6*3),ncol=3)
Y <- normvari(X)
# normalized varimax rotated version of X
Y$B
# rotation matrix
Y$T



