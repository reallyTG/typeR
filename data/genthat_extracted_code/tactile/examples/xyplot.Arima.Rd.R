library(tactile)


### Name: xyplot.Arima
### Title: Diagnostic Plots for ARIMA Models
### Aliases: xyplot.Arima

### ** Examples

fit <- arima(lh, order = c(1, 1, 0))
xyplot(fit, layout = c(2, 2))
xyplot(fit, which = c(1:2, 4), layout = rbind(c(1, 1), c(2, 3)))



