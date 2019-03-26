library(virtualspecies)


### Name: logisticFun
### Title: Logistic function
### Aliases: logisticFun

### ** Examples

x <- 1:100
y <- logisticFun(x, alpha = -10, b = 50)
plot(y ~ x, type = "l")

# The effect of alpha:
y1 <- logisticFun(x, alpha = -0.01, b = 50)
y2 <- logisticFun(x, alpha = -10, b = 50)
y3 <- logisticFun(x, alpha = -1000, b = 50)

par(mfrow = c(1, 3))
plot(y1 ~ x, type = "l", main = expression(alpha %->% 0))
plot(y2 ~ x, type = "l", main = expression(alpha %~~% range(x)/10))
plot(y3 ~ x, type = "l", main = expression(alpha %->% infinity))



