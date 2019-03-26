library(ThreeWay)


### Name: varim
### Title: Varimax roation
### Aliases: varim
### Keywords: array multivariate algebra

### ** Examples

X <- matrix(rnorm(6*3),ncol=3)
Y <- varim(X)
# varimax rotated version of X
Y$B
# rotation matrix
Y$T



