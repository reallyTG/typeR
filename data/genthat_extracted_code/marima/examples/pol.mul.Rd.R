library(marima)


### Name: pol.mul
### Title: pol.mul
### Aliases: pol.mul

### ** Examples

set.seed(4711)
p1 <- check.one(matrix(rnorm(16), nrow=4))
p2 <- check.one(array(rnorm(32),dim=c(4, 4, 2)))
p12 <- pol.mul(p1, p2, L=(2+3))
short.form(p12)




