library(kernelboot)


### Name: rmvk
### Title: Random generation from product kernel density
### Aliases: rmvk

### ** Examples


dat <- mtcars[, c("mpg", "disp")]

partmp <- par(mfrow = c(1, 2), mar = c(3, 3, 3, 3))

plot(rmvk(5000, dat, shrinked = FALSE), col = "#458B004D", pch = 16,
     xlim = c(0, 45), ylim = c(-200, 800),
     main = "Product kernel", axes = FALSE)
points(dat, pch = 2, lwd = 2, col = "red")
axis(1); axis(2)

plot(rmvk(5000, dat, shrinked = TRUE), col = "#458B004D", pch = 16,
     xlim = c(0, 45), ylim = c(-200, 800),
     main = "Product kernel (shrinked)", axes = FALSE)
points(dat, pch = 2, lwd = 2, col = "red")
axis(1); axis(2)

par(partmp)

cov(dat)
cov(rmvk(5000, dat, shrinked = FALSE))
cov(rmvk(5000, dat, shrinked = TRUE))




