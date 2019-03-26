library(NISTnls)


### Name: MGH10
### Title: More, Gabrow and Hillstrom example 10
### Aliases: MGH10
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = MGH10)
## check plot on log scale for shape
plot(y ~ x, data = MGH10, log = "y")
## starting values for this run are ridiculous
Try(fm1 <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b1 = 2, b2 = 400000, b3 = 25000)))
Try(fm1a <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10,
                trace = TRUE, alg = "port",
                start = c(b1 = 2, b2 = 400000, b3 = 25000)))
Try(fm2 <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b1 = 0.02, b2 = 4000, b3 = 250)))
Try(fm2a <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10,
                trace = TRUE, alg = "port",
                start = c(b1 = 0.02, b2 = 4000, b3 = 250)))
Try(fm3 <- nls(y ~ exp(b2/(x+b3)), data = MGH10, trace = TRUE,
               start = c(b2 = 400000, b3 = 25000),
               algorithm = "plinear"))
Try(fm4 <- nls(y ~ exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b2 = 4000, b3 = 250),
           algorithm = "plinear"))



