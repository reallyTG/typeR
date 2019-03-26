library(extraDistr)


### Name: TruncPoisson
### Title: Truncated Poisson distribution
### Aliases: TruncPoisson dtpois ptpois qtpois rtpois
### Keywords: distribution

### ** Examples


x <- rtpois(1e5, 14, 16)
xx <- seq(-1, 50)
plot(prop.table(table(x)))
lines(xx, dtpois(xx, 14, 16), col = "red")
hist(ptpois(x, 14, 16))

xx <- seq(0, 50, by = 0.01)
plot(ecdf(x))
lines(xx, ptpois(xx, 14, 16), col = "red", lwd = 2)

uu <- seq(0, 1, by = 0.001)
lines(qtpois(uu, 14, 16), uu, col = "blue", lty = 2)

# Zero-truncated Poisson

x <- rtpois(1e5, 5, 0)
xx <- seq(-1, 50)
plot(prop.table(table(x)))
lines(xx, dtpois(xx, 5, 0), col = "red")
hist(ptpois(x, 5, 0))

xx <- seq(0, 50, by = 0.01)
plot(ecdf(x))
lines(xx, ptpois(xx, 5, 0), col = "red", lwd = 2)
lines(qtpois(uu, 5, 0), uu, col = "blue", lty = 2)




