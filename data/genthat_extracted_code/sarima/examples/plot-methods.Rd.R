library(sarima)


### Name: plot-methods
### Title: Plot methods in package sarima
### Aliases: plot-methods plot,SampleAutocorrelations,matrix-method
###   plot,SampleAutocorrelations,missing-method
###   plot,SamplePartialAutocorrelations,missing-method
### Keywords: methods hplot

### ** Examples

n <- 5000
x <- sarima:::rgarch1p1(n, alpha = 0.3, beta = 0.55, omega = 1, n.skip = 100)
x.acf <- autocorrelations(x)
x.acf
x.pacf <- partialAutocorrelations(x)
x.pacf

plot(x.acf)
plot(x.acf, data = x)

plot(x.pacf)
plot(x.pacf, data = x)

plot(x.acf, data = x, main = "Autocorrelation test")
plot(x.pacf, data = x, main = "Partial autocorrelation test")

plot(x.acf, ylim = c(NA,1))
plot(x.acf, ylim.fac = 1.5)
plot(x.acf, data = x, ylim.fac = 1.5)
plot(x.acf, data = x, ylim = c(NA, 1))



