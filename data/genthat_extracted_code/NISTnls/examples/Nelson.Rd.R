library(NISTnls)


### Name: Nelson
### Title: Dialectric breakdown data
### Aliases: Nelson
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x1, data = Nelson, log = "y")
plot(y ~ x2, data = Nelson, log = "y")
coplot(y ~ x1 | x2, data = Nelson)
coplot(y ~ x2 | x1, data = Nelson)

Try(fm1 <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
           start = c(b1 = 2, b2 = 0.0001, b3 = -0.01), trace = TRUE))
Try(fm1a <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
            trace = TRUE, alg = "port",
            start = c(b1 = 2, b2 = 0.0001, b3 = -0.01)))

Try(fm2 <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
           start = c(b1 = 2.5, b2 = 0.000000005, b3 = -0.05), trace = TRUE))
Try(fm2 <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
           trace = TRUE, alg = "port", 
           start = c(b1 = 2.5, b2 = 0.000000005, b3 = -0.05)))

Try(fm3 <- nls(log(y) ~ cbind(1, -x1 * exp(-b3*x2)), data = Nelson,
           start = c(b3 = -0.01), trace = TRUE, algorithm = "plinear"))

Try(fm4 <- nls(log(y) ~ cbind(1, -x1 * exp(-b3*x2)), data = Nelson,
           start = c(b3 = -0.05), trace = TRUE, algorithm = "plinear"))



