library(cointmonitoR)


### Name: plot.cointmonitoR
### Title: Plot Method for Monitoring Procedures.
### Aliases: plot.cointmonitoR

### ** Examples

### Monitoring stationarity (no break):
set.seed(1909)
x = rnorm(200)
test = monitorStationarity(x, m = 0.5)
plot(test)

oldpar = par(mfrow = c(2, 1), mar = c(4, 4, 1, 1))
plot(test, what = "both", legend = FALSE, main = "", main.val = "")
par(oldpar)


### Monitoring stationarity (break):
x = c(x[1:100], cumsum(rnorm(100, sd = 0.5)) + x[101:200])
test2 = monitorStationarity(x, m = 0.5)
plot(test2)

oldpar = par(mfrow = c(2, 1), mar = c(4, 4, 1, 1))
plot(test2, what = "both", legend = FALSE, main = "", main.val = "")
par(oldpar)


### Monitoring cointegration (no break):
set.seed(42)
x = data.frame(x1 = cumsum(rnorm(200)), x2 = cumsum(rnorm(200)))
eps1 = rnorm(200, sd = 2)
y = x$x1 - x$x2 + 10 + eps1
test3 = monitorCointegration(x = x, y = y, m = 0.5, model = "FM")
plot(test3)

oldpar = par(mfrow = c(2, 1), mar = c(4, 4, 1, 1))
plot(test3, what = "both", legend = FALSE, main = "", main.val = "")
par(oldpar)


### Monitoring cointegration (break):
eps2 = c(eps1[1:100], cumsum(eps1[101:200]))
y = x$x1 - x$x2 + 10 + eps2
test4 = monitorCointegration(x = x, y = y, m = 0.5, model = "FM")
plot(test4)

oldpar = par(mfrow = c(2, 1), mar = c(4, 4, 1, 1))
plot(test4, what = "both", legend = FALSE, main = "", main.val = "")
par(oldpar)




