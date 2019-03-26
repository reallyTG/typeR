library(extraDistr)


### Name: TruncNormal
### Title: Truncated normal distribution
### Aliases: TruncNormal dtnorm ptnorm qtnorm rtnorm
### Keywords: distribution

### ** Examples


x <- rtnorm(1e5, 5, 3, b = 7)
hist(x, 100, freq = FALSE)
curve(dtnorm(x, 5, 3, b = 7), -8, 8, col = "red", add = TRUE)
hist(ptnorm(x, 5, 3, b = 7))
plot(ecdf(x))
curve(ptnorm(x, 5, 3, b = 7), -8, 8, col = "red", lwd = 2, add = TRUE)

R <- 1e5
partmp <- par(mfrow = c(2,4), mar = c(2,2,2,2))

hist(rtnorm(R), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x), -5, 5, col = "red", add = TRUE)

hist(rtnorm(R, a = 0), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, a = 0), -1, 5, col = "red", add = TRUE)

hist(rtnorm(R, b = 0), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, b = 0), -5, 5, col = "red", add = TRUE)

hist(rtnorm(R, a = 0, b = 1), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, a = 0, b = 1), -1, 2, col = "red", add = TRUE)

hist(rtnorm(R, a = -1, b = 0), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, a = -1, b = 0), -2, 2, col = "red", add = TRUE)

hist(rtnorm(R, mean = -6, a = 0), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, mean = -6, a = 0), -2, 1, col = "red", add = TRUE)

hist(rtnorm(R, mean = 8, b = 0), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, mean = 8, b = 0), -2, 1, col = "red", add = TRUE)

hist(rtnorm(R, a = 3, b = 5), freq= FALSE, main = "", xlab = "", ylab = "")
curve(dtnorm(x, a = 3, b = 5), 2, 5, col = "red", add = TRUE)

par(partmp)




