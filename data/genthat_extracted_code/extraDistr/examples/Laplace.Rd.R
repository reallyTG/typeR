library(extraDistr)


### Name: Laplace
### Title: Laplace distribution
### Aliases: Laplace dlaplace plaplace qlaplace rlaplace
### Keywords: distribution

### ** Examples


x <- rlaplace(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dlaplace(x, 5, 16), -200, 200, n = 500, col = "red", add = TRUE)
hist(plaplace(x, 5, 16))
plot(ecdf(x))
curve(plaplace(x, 5, 16), -200, 200, n = 500, col = "red", lwd = 2, add = TRUE)




