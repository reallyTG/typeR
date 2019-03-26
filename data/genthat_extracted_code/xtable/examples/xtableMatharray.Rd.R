library(xtable)


### Name: xtableMatharray
### Title: Create LaTeX Mathematical Array
### Aliases: xtableMatharray
### Keywords: print

### ** Examples

V <- matrix(c(1.140380e-03,  3.010497e-05,  7.334879e-05,
              3.010497e-05,  3.320683e-04, -5.284854e-05,
              7.334879e-05, -5.284854e-05,  3.520928e-04), nrow = 3)
mth <- xtableMatharray(V)
class(mth)
str(mth)
unclass(mth)



