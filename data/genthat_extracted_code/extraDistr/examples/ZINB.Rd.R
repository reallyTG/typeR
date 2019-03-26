library(extraDistr)


### Name: ZINB
### Title: Zero-inflated negative binomial distribution
### Aliases: ZINB dzinb pzinb qzinb rzinb
### Keywords: distribution

### ** Examples


x <- rzinb(1e5, 100, 0.6, 0.33)
xx <- -2:200
plot(prop.table(table(x)), type = "h")
lines(xx, dzinb(xx, 100, 0.6, 0.33), col = "red")

xx <- seq(0, 200, by = 0.01)
plot(ecdf(x))
lines(xx, pzinb(xx, 100, 0.6, 0.33), col = "red")




