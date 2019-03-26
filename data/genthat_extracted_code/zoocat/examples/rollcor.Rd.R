library(zoocat)


### Name: rollcor
### Title: Calculate the rolling window correlations
### Aliases: rollcor rollcor.default rollcor.zoo

### ** Examples


x <- 1 : 100
y <- 2 * x + rnorm(100, 0, 10)
rollcor(x, y, width = 21)

xz <- zoo(x)
yz <- zoo(y)
rollcor(xz, yz, width = 21)

rollcor(xz, yz, width = 21, show = FALSE)

x <- 1 : 100
y <- 2 * x  + rnorm(100, 0, 10)
x <- zoo(x, order.by = 10 : 109)
y <- zoo(y, order.by = -3 : 96)
rollcor(x, y, width = 21, method = 'kendall')




