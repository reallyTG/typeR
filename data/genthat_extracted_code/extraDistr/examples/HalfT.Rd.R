library(extraDistr)


### Name: HalfT
### Title: Half-t distribution
### Aliases: HalfT dht pht qht rht
### Keywords: distribution

### ** Examples


x <- rht(1e5, 2, 2)
hist(x, 500, freq = FALSE, xlim = c(0, 100))
curve(dht(x, 2, 2), 0, 100, col = "red", add = TRUE)
hist(pht(x, 2, 2))
plot(ecdf(x), xlim = c(0, 100))
curve(pht(x, 2, 2), 0, 100, col = "red", lwd = 2, add = TRUE)




