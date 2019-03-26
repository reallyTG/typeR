library(Momocs)


### Name: bezier_i
### Title: Calculates a shape from Bezier coefficients
### Aliases: bezier_i

### ** Examples

set.seed(34)
x <- coo_sample(efourier_shape(), 5)
plot(x, ylim=c(-3, 3), asp=1, type='b', pch=20)
b <- bezier(x)
bi <- bezier_i(b$B)
lines(bi, col='red')



