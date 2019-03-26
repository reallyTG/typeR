library(Matrix)


### Name: LU-class
### Title: LU (dense) Matrix Decompositions
### Aliases: LU-class denseLU-class expand,denseLU-method
### Keywords: classes algebra

### ** Examples

set.seed(1)
mm <- Matrix(round(rnorm(9),2), nrow = 3)
mm
str(lum <- lu(mm))
elu <- expand(lum)
elu # three components: "L", "U", and "P", the permutation
elu$L %*% elu$U
(m2 <- with(elu, P %*% L %*% U)) # the same as 'mm'
stopifnot(all.equal(as(mm, "matrix"),
                    as(m2, "matrix")))



