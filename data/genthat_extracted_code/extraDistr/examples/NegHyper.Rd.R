library(extraDistr)


### Name: NegHyper
### Title: Negative hypergeometric distribution
### Aliases: NegHyper dnhyper pnhyper qnhyper rnhyper
### Keywords: distribution

### ** Examples


x <- rnhyper(1e5, 60, 35, 15)
xx <- 15:95
plot(prop.table(table(x)))
lines(xx, dnhyper(xx, 60, 35, 15), col = "red")
hist(pnhyper(x, 60, 35, 15))

xx <- seq(0, 100, by = 0.01)
plot(ecdf(x))
lines(xx, pnhyper(xx, 60, 35, 15), col = "red", lwd = 2)




