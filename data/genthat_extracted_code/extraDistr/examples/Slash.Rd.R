library(extraDistr)


### Name: Slash
### Title: Slash distribution
### Aliases: Slash dslash pslash rslash
### Keywords: distribution

### ** Examples


x <- rslash(1e5, 5, 3)
hist(x, 1e5, freq = FALSE, xlim = c(-100, 100))
curve(dslash(x, 5, 3), -100, 100, col = "red", n = 500, add = TRUE)
hist(pslash(x, 5, 3))
plot(ecdf(x), xlim = c(-100, 100))
curve(pslash(x, 5, 3), -100, 100, col = "red", lwd = 2, n = 500, add = TRUE)




