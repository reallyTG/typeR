library(KSPM)


### Name: deviance.kspm
### Title: Model deviance
### Aliases: deviance.kspm

### ** Examples

x <- 1:15
y <- 3*x + rnorm(15, 0, 2)
fit <- kspm(y, kernel = ~ Kernel(x, kernel.function = "linear"))
deviance(fit)




