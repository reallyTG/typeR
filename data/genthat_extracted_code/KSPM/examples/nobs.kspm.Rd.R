library(KSPM)


### Name: nobs.kspm
### Title: Extract the number of observations from a Kernel Semi parametric
###   Model Fit
### Aliases: nobs.kspm

### ** Examples

x <- 1:15
y <- 3*x + rnorm(15, 0, 2)
fit <- kspm(y, kernel = ~ Kernel(x, kernel.function = "linear"))
nobs(fit)




