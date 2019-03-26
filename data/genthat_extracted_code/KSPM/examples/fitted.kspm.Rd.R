library(KSPM)


### Name: fitted.kspm
### Title: Extract Model Fitted values
### Aliases: fitted.kspm

### ** Examples

x <- 1:15
z <- runif(15, 1, 6)
y <- 3*x + z^2 + rnorm(15, 0, 2)
fit <- kspm(y, linear = ~ x, kernel = ~ Kernel(z,
kernel.function = "polynomial", d = 2, rho = 1, gamma = 0))
fitted(fit)




