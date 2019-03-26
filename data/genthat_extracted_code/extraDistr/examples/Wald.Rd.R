library(extraDistr)


### Name: Wald
### Title: Wald (inverse Gaussian) distribution
### Aliases: Wald dwald pwald rwald
### Keywords: distribution

### ** Examples


x <- rwald(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dwald(x, 5, 16), 0, 50, col = "red", add = TRUE)
hist(pwald(x, 5, 16))
plot(ecdf(x))
curve(pwald(x, 5, 16), 0, 50, col = "red", lwd = 2, add = TRUE)




