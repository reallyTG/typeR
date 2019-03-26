library(ForeCA)


### Name: quadratic_form
### Title: Computes quadratic form x' A x
### Aliases: fill_hermitian quadratic_form
### Keywords: math univar

### ** Examples

 set.seed(1)
 AA <- matrix(1:4, ncol = 2)
 bb <- matrix(rnorm(2))
 t(bb) %*% AA %*% bb
 quadratic_form(AA, bb)



AA <- matrix(1:16, ncol = 4)
AA[lower.tri(AA)] <- NA
AA

fill_hermitian(AA)




