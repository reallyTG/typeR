library(extraDistr)


### Name: GEV
### Title: Generalized extreme value distribution
### Aliases: GEV dgev pgev qgev rgev
### Keywords: distribution

### ** Examples


curve(dgev(x, xi = -1/2), -4, 4, col = "green", ylab = "")
curve(dgev(x, xi = 0), -4, 4, col = "red", add = TRUE)
curve(dgev(x, xi = 1/2), -4, 4, col = "blue", add = TRUE)
legend("topleft", col = c("green", "red", "blue"), lty = 1,
       legend = expression(xi == -1/2, xi == 0, xi == 1/2), bty = "n")

x <- rgev(1e5, 5, 2, .5)
hist(x, 1000, freq = FALSE, xlim = c(0, 50))
curve(dgev(x, 5, 2, .5), 0, 50, col = "red", add = TRUE, n = 5000)
hist(pgev(x, 5, 2, .5))
plot(ecdf(x), xlim = c(0, 50))
curve(pgev(x, 5, 2, .5), 0, 50, col = "red", lwd = 2, add = TRUE)




