library(extraDistr)


### Name: Gompertz
### Title: Gompertz distribution
### Aliases: Gompertz dgompertz pgompertz qgompertz rgompertz
### Keywords: distribution

### ** Examples


x <- rgompertz(1e5, 5, 2)
hist(x, 100, freq = FALSE)
curve(dgompertz(x, 5, 2), 0, 1, col = "red", add = TRUE)
hist(pgompertz(x, 5, 2))
plot(ecdf(x))
curve(pgompertz(x, 5, 2), 0, 1, col = "red", lwd = 2, add = TRUE)




