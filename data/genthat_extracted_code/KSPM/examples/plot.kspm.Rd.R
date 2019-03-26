library(KSPM)


### Name: plot.kspm
### Title: Plot Diagnostics for a kspm Object
### Aliases: plot.kspm

### ** Examples

x <- 1:15
z1 <- runif(15, 1, 6)
z2 <- rnorm(15, 1, 2)
y <- 3*x + (z1 + z2)^2 + rnorm(15, 0, 2)
fit <- kspm(y, linear = ~ x, kernel = ~ Kernel(~ z1 + z2,
kernel.function = "polynomial", d= 2, rho = 1, gamma = 0))
plot(fit)




