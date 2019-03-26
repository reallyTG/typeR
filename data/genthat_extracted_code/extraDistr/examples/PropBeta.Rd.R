library(extraDistr)


### Name: PropBeta
### Title: Beta distribution of proportions
### Aliases: PropBeta dprop pprop qprop rprop
### Keywords: distribution

### ** Examples


x <- rprop(1e5, 100, 0.33)
hist(x, 100, freq = FALSE)
curve(dprop(x, 100, 0.33), 0, 1, col = "red", add = TRUE)
hist(pprop(x, 100, 0.33))
plot(ecdf(x))
curve(pprop(x, 100, 0.33), 0, 1, col = "red", lwd = 2, add = TRUE)

n <- 500
p <- 0.23
k <- rbinom(1e5, n, p)
hist(k/n, freq = FALSE, 100)
curve(dprop(x, n, p), 0, 1, col = "red", add = TRUE, n = 500)
                       



