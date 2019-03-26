library(actuar)


### Name: PoissonInverseGaussian
### Title: The Poisson-Inverse Gaussian Distribution
### Aliases: PoissonInverseGaussian PIG dpoisinvgauss ppoisinvgauss
###   qpoisinvgauss rpoisinvgauss dpig ppig qpig rpig
### Keywords: distribution

### ** Examples

## Tables I and II of Shaban (1981)
x <- 0:2
sapply(c(0.4, 0.8, 1), dpoisinvgauss, x = x, mean = 0.1)
sapply(c(40, 80, 100, 130), dpoisinvgauss, x = x, mean = 1)

qpoisinvgauss(ppoisinvgauss(0:10, 1, dis = 2.5), 1, dis = 2.5)

x <- rpoisinvgauss(1000, 1, dis = 2.5)
y <- sort(unique(x))
plot(y, table(x)/length(x), type = "h", lwd = 2,
     pch = 19, col = "black", xlab = "x", ylab = "p(x)",
     main = "Empirical vs theoretical probabilities")
points(y, dpoisinvgauss(y, 1, dis = 2.5),
       pch = 19, col = "red")
legend("topright", c("empirical", "theoretical"),
       lty = c(1, NA), pch = c(NA, 19), col = c("black", "red"))



