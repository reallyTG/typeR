library(extraDistr)


### Name: Kumaraswamy
### Title: Kumaraswamy distribution
### Aliases: Kumaraswamy dkumar pkumar qkumar rkumar
### Keywords: distribution

### ** Examples


x <- rkumar(1e5, 5, 16)
hist(x, 100, freq = FALSE)
curve(dkumar(x, 5, 16), 0, 1, col = "red", add = TRUE)
hist(pkumar(x, 5, 16))
plot(ecdf(x))
curve(pkumar(x, 5, 16), 0, 1, col = "red", lwd = 2, add = TRUE)




