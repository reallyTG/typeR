library(extraDistr)


### Name: HalfNormal
### Title: Half-normal distribution
### Aliases: HalfNormal dhnorm phnorm qhnorm rhnorm
### Keywords: distribution

### ** Examples


x <- rhnorm(1e5, 2)
hist(x, 100, freq = FALSE)
curve(dhnorm(x, 2), 0, 8, col = "red", add = TRUE)
hist(phnorm(x, 2))
plot(ecdf(x))
curve(phnorm(x, 2), 0, 8, col = "red", lwd = 2, add = TRUE)




