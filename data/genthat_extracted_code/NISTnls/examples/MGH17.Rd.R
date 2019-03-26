library(NISTnls)


### Name: MGH17
### Title: More, Gabrow and Hillstrom example 17
### Aliases: MGH17
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = MGH17)

## Starting values here are ridiculous
Try(fm1 <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
           data = MGH17, trace = TRUE,
           start = c(b1 = 50, b2 = 150, b3 = -100, b4 = 1, b5 = 2)))
Try(fm1a <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
           data = MGH17, trace = TRUE, alg = "port",
           start = c(b1 = 50, b2 = 150, b3 = -100, b4 = 1, b5 = 2)))

Try(fm2 <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
           data = MGH17, trace = TRUE,
           start = c(b1 = 0.5, b2 = 1.5, b3 = -1, b4 = 0.01, b5 = 0.02)))
Try(fm2a <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
           data = MGH17, trace = TRUE, alg = "port",
           start = c(b1 = 0.5, b2 = 1.5, b3 = -1, b4 = 0.01, b5 = 0.02)))

Try(fm3 <- nls(y ~ cbind(1, exp(-x*b4), exp(-x*b5)),
           data = MGH17, trace = TRUE, algorithm = "plinear",
           start = c(b4 = 1, b5 = 2)))

Try(fm4 <- nls(y ~ cbind(1, exp(-x*b4), exp(-x*b5)),
           data = MGH17, trace = TRUE, algorithm = "plinear",
           start = c(b4 = 0.01, b5 = 0.02)))



