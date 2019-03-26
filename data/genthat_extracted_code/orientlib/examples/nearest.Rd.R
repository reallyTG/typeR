library(orientlib)


### Name: nearest
### Title: Find nearest SO(3) or orthogonal matrix.
### Aliases: nearest.SO3 nearest.orthog
### Keywords: array algebra

### ** Examples

x <- matrix(rnorm(9), 3,3)
nearest.orthog(x)
nearest.SO3(x)
x <- -x
nearest.orthog(x)
nearest.SO3(x)



