library(KSPM)


### Name: residuals.kspm
### Title: Extract residuals from a Kernel Semi Parametric Model
### Aliases: residuals.kspm

### ** Examples

x <- 1:15
y <- 3*x + rnorm(15, 0, 2)
fit <- kspm(y, kernel = ~ Kernel(x, kernel.function = "linear"))
residuals(fit)




