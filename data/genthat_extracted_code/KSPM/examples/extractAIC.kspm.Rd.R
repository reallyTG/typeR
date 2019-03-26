library(KSPM)


### Name: extractAIC.kspm
### Title: Extract AIC from a Kernel Semi Parametric Model
### Aliases: extractAIC.kspm

### ** Examples

x <- 1:15
y <- 3*x + rnorm(15, 0, 2)
fit <- kspm(y, kernel = ~ Kernel(x, kernel.function = "linear"))
extractAIC(fit)




