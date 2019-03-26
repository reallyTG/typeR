library(NISTnls)


### Name: MGH09
### Title: More, Gabrow and Hillstrom example 9
### Aliases: MGH09
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = MGH09)
## starting values for this attempt are ridiculous
Try(fm1 <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE,
           start = c(b1 = 25, b2 = 39, b3 = 41.5, b4 = 39)))
Try(fm1a <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, alg = "port",
           start = c(b1 = 25, b2 = 39, b3 = 41.5, b4 = 39)))

Try(fm2 <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE,
           start = c(b1 = 0.25, b2 = 0.39, b3 = 0.415, b4 = 0.39)))
Try(fm2a <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, alg = "port",
           start = c(b1 = 0.25, b2 = 0.39, b3 = 0.415, b4 = 0.39)))
Try(fm3 <- nls(y ~ cbind(x, x**2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, algorithm = "plinear",
           start = c(b3 = 41.5, b4 = 39)))
Try(fm4 <- nls(y ~ cbind(x, x**2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, algorithm = "plinear",
           start = c(b3 = 0.415, b4 = 0.39)))



