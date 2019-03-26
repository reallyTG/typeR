library(PMwR)


### Name: plot_trading_hours
### Title: Plot Time Series During Trading Hours
### Aliases: plotTradingHours plot_trading_hours
### Keywords: chron hplot ts

### ** Examples

t <- as.POSIXct("2012-08-31 08:00:00") + 0:32400
x <- runif(length(t))

par(tck = 0.001, mgp = c(3,1,0.5), bty = "n")
p <- plot_trading_hours(x, t,
                        interval = "5 min", labels = "hours",
                        xlab = "time", ylab = "random points",
                        col = "blue")


## with ?lines
t <- as.POSIXct("2012-08-31 10:00:00") + 0:9000
x <- seq(0, 1, length.out = 9001)
lines(p$map(t)$t, x[p$map(t)$ix], pch = 19)




