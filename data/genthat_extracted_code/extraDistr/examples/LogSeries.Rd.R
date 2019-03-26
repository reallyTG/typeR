library(extraDistr)


### Name: LogSeries
### Title: Logarithmic series distribution
### Aliases: LogSeries dlgser plgser qlgser rlgser
### Keywords: distribution

### ** Examples


x <- rlgser(1e5, 0.66)
xx <- seq(0, 100, by = 1)
plot(prop.table(table(x)), type = "h")
lines(xx, dlgser(xx, 0.66), col = "red")

# Notice: distribution of F(X) is far from uniform:
hist(plgser(x, 0.66), 50)

xx <- seq(0, 100, by = 0.01)
plot(ecdf(x))
lines(xx, plgser(xx, 0.66), col = "red", lwd = 2)




