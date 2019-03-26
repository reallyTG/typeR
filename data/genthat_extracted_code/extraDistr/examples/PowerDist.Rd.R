library(extraDistr)


### Name: PowerDist
### Title: Power distribution
### Aliases: PowerDist dpower ppower qpower rpower
### Keywords: distribution

### ** Examples


x <- rpower(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dpower(x, 5, 16), 2, 6, col = "red", add = TRUE, n = 5000)
hist(ppower(x, 5, 16))
plot(ecdf(x))
curve(ppower(x, 5, 16), 2, 6, col = "red", lwd = 2, add = TRUE)




