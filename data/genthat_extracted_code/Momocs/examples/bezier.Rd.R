library(Momocs)


### Name: bezier
### Title: Calculates Bezier coefficients from a shape
### Aliases: bezier

### ** Examples

set.seed(34)
x <- coo_sample(efourier_shape(), 5)
plot(x, ylim=c(-3, 3), asp=1, type='b', pch=20)
b <- bezier(x)
bi <- bezier_i(b$B)
lines(bi, col='red')



