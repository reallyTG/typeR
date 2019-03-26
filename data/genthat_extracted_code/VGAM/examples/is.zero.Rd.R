library(VGAM)


### Name: is.zero
### Title: Zero Constraint Matrices
### Aliases: is.zero is.zero.matrix is.zero.vglm
### Keywords: models regression

### ** Examples

coalminers <- transform(coalminers, Age = (age - 42) / 5)
fit <- vglm(cbind(nBnW,nBW,BnW,BW) ~ Age, binom2.or(zero = NULL), coalminers)
is.zero(fit)
is.zero(coef(fit, matrix = TRUE))



