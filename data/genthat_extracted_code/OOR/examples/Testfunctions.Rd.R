library(OOR)


### Name: Test functions
### Title: Test functions of 'x'
### Aliases: 'Test functions' guirland sin1 sin1 difficult difficult2
###   double_sine

### ** Examples

par(mfrow = c(2,3))

curve(guirland, n = 501)
curve(sin1)
curve(difficult, xlim = c(1e-8, 1), n = 1001)
xgrid <- seq(0, 1, length.out = 500)
plot(xgrid, sapply(xgrid, difficult2), type = 'l', ylab = "difficult2(x)")
plot(xgrid, sapply(xgrid, double_sine), type = 'l', ylab = "double_sine(x) (default)")
double_sine2 <- function(x) double_sine(x, rho1 = 0.8, rho2 = 0.3)
plot(xgrid, sapply(xgrid, double_sine2), type = 'l', ylab = "double_sine(x) (modified)")

par(mfrow = c(1,1))



