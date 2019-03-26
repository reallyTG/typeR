library(KSPM)


### Name: logLik.kspm
### Title: Log Likelihood of a kspm Object
### Aliases: logLik.kspm

### ** Examples

x <- 1:15
y <- 3*x + rnorm(15, 0, 2)
fit <- kspm(y, kernel = ~ Kernel(x, kernel.function = "linear"))
logLik(fit)




