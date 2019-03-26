library(NISTnls)


### Name: Roszman1
### Title: Quantum defects in iodine
### Aliases: Roszman1
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Roszman1)
Try(fm1 <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.1, b2 = -0.00001, b3 = 1000, b4 = -100),
           trace = TRUE))
Try(fm1a <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.1, b2 = -0.00001, b3 = 1000, b4 = -100),
           alg = "port", trace = TRUE))
Try(fm2 <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.2, b2 = -0.0000015, b3 = 1200, b4 = -150),
           trace = TRUE))
Try(fm2a <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.2, b2 = -0.0000015, b3 = 1200, b4 = -150),
           alg = "port", trace = TRUE))



