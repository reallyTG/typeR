library(cointmonitoR)


### Name: monitorCointegration
### Title: Procedure for Monitoring Level and Trend Cointegration
### Aliases: monitorCointegration

### ** Examples

set.seed(42)
x = data.frame(x1 = cumsum(rnorm(200)), x2 = cumsum(rnorm(200)))
eps1 = rnorm(200, sd = 2)
eps2 = c(eps1[1:100], cumsum(eps1[101:200]))

y = x$x1 - x$x2 + 10 + eps1
monitorCointegration(x = x, y = y, m = 0.5, model = "FM")

y2 = y + seq(1, 30, length = 200)
monitorCointegration(x = x, y = y2, m = 0.5, model = "FM")
monitorCointegration(x = x, y = y2, m = 0.5, trend = TRUE, model = "FM")

y3 = x$x1 - x$x2 + 10 + eps2
monitorCointegration(x = x, y = y3, m = 0.5, model = "FM")
monitorCointegration(x = x, y = y3, m = 0.5, model = "D")
monitorCointegration(x = x, y = y3, m = 0.5, model = "IM")




