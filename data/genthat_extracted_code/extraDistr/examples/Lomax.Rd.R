library(extraDistr)


### Name: Lomax
### Title: Lomax distribution
### Aliases: Lomax dlomax plomax qlomax rlomax
### Keywords: distribution

### ** Examples


x <- rlomax(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dlomax(x, 5, 16), 0, 1, col = "red", add = TRUE, n = 5000)
hist(plomax(x, 5, 16))
plot(ecdf(x))
curve(plomax(x, 5, 16), 0, 1, col = "red", lwd = 2, add = TRUE)




