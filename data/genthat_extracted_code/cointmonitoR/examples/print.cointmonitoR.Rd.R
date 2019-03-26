library(cointmonitoR)


### Name: print.cointmonitoR
### Title: Print Method for Monitoring Procedures.
### Aliases: print.cointmonitoR

### ** Examples

set.seed(42)
test = monitorStationarity(rnorm(100), m = 0.5)
print(test)

x = data.frame(x1 = cumsum(rnorm(200)), x2 = cumsum(rnorm(200)))
eps1 = rnorm(200, sd = 2)
eps2 = c(eps1[1:100], cumsum(eps1[101:200]))
y1 = x$x1 - x$x2 + 10 + eps1
y2 = x$x1 - x$x2 + 10 + eps2
test1 = monitorCointegration(x = x, y = y1, m = 0.5, model = "FM")
print(test1)
test2 = monitorCointegration(x = x, y = y2, m = 0.5, model = "FM")
print(test2)




