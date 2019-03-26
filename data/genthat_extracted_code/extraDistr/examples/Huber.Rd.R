library(extraDistr)


### Name: Huber
### Title: "Huber density" distribution
### Aliases: Huber dhuber phuber qhuber rhuber
### Keywords: distribution

### ** Examples


x <- rhuber(1e5, 5, 2, 3)
hist(x, 100, freq = FALSE)
curve(dhuber(x, 5, 2, 3), -20, 20, col = "red", add = TRUE, n = 5000)
hist(phuber(x, 5, 2, 3))
plot(ecdf(x))
curve(phuber(x, 5, 2, 3), -20, 20, col = "red", lwd = 2, add = TRUE)




