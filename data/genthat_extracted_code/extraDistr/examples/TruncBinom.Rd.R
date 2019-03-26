library(extraDistr)


### Name: TruncBinom
### Title: Truncated binomial distribution
### Aliases: TruncBinom dtbinom ptbinom qtbinom rtbinom
### Keywords: distribution

### ** Examples


x <- rtbinom(1e5, 100, 0.83, 76, 86)
xx <- seq(0, 100)
plot(prop.table(table(x)))
lines(xx, dtbinom(xx, 100, 0.83, 76, 86), col = "red")
hist(ptbinom(x, 100, 0.83, 76, 86))

xx <- seq(0, 100, by = 0.01)
plot(ecdf(x))
lines(xx, ptbinom(xx, 100, 0.83, 76, 86), col = "red", lwd = 2)
uu <- seq(0, 1, by = 0.001)
lines(qtbinom(uu, 100, 0.83, 76, 86), uu, col = "blue", lty = 2)




