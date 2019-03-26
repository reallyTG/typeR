library(extraDistr)


### Name: Bhattacharjee
### Title: Bhattacharjee distribution
### Aliases: Bhattacharjee dbhatt pbhatt rbhatt
### Keywords: distribution

### ** Examples


x <- rbhatt(1e5, 5, 3, 5)
hist(x, 100, freq = FALSE)
curve(dbhatt(x, 5, 3, 5), -20, 20, col = "red", add = TRUE)
hist(pbhatt(x, 5, 3, 5))
plot(ecdf(x))
curve(pbhatt(x, 5, 3, 5), -20, 20, col = "red", lwd = 2, add = TRUE)




