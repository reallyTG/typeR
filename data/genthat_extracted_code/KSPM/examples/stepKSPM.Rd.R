library(KSPM)


### Name: stepKSPM
### Title: Choose a model by AIC or BIC in a Stepwise Algorithm
### Aliases: stepKSPM

### ** Examples

x <- 1:15
z1 <- runif(15, 1, 6)
z2 <- rnorm(15, 1, 4)
z3 <- rnorm(15, 6, 2)
z4 <- runif(15, -10, 2)
y <- 3*x + (z1 + z2)^2 + rnorm(15, 0, 2)
dfrm <- data.frame(x = x, z1 = z1, z2 = z2, z3 = z3, z4 = z4, y = y)
fit <- kspm(y, linear = ~ x, kernel = ~ Kernel(~ z1 + z2 + z3 + z4,
kernel.function = "polynomial", d= 2, rho = 1, gamma = 0), data = dfrm)
stepKSPM(fit, k = 2, data = dfrm)




