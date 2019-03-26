library(extraDistr)


### Name: Triangular
### Title: Triangular distribution
### Aliases: Triangular dtriang ptriang qtriang rtriang
### Keywords: distribution

### ** Examples


x <- rtriang(1e5, 5, 7, 6)
hist(x, 100, freq = FALSE)
curve(dtriang(x, 5, 7, 6), 3, 10, n = 500, col = "red", add = TRUE)
hist(ptriang(x, 5, 7, 6))
plot(ecdf(x))
curve(ptriang(x, 5, 7, 6), 3, 10, n = 500, col = "red", lwd = 2, add = TRUE)




