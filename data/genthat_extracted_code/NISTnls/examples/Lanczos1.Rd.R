library(NISTnls)


### Name: Lanczos1
### Title: Generated data
### Aliases: Lanczos1
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Lanczos1)
## plot on log scale to see the apparent number of exponential terms
plot(y ~ x, data = Lanczos1, log = "y")
## data are an exact fit so the convergence criterion fails
Try(fm1 <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos1, trace = TRUE,
           start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6, b4 = 5.5,
                     b5 = 6.5, b6 = 7.6)))
Try(fm1a <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
                data = Lanczos1, trace = TRUE, alg = "port",
                start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6,
                          b4 = 5.5, b5 = 6.5, b6 = 7.6)))
## data are an exact fit so the convergence criterion fails
Try(fm2 <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos1, trace = TRUE,
           start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6, b4 = 4.2,
                     b5 = 4, b6 = 6.3)))
Try(fm2a <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
                data = Lanczos1, trace = TRUE, alg = "port",
                start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6,
                          b4 = 4.2, b5 = 4, b6 = 6.3)))
## data are an exact fit so the convergence criterion fails
Try(fm3 <- nls(y ~ exp(outer(x,-c(b2, b4, b6))),
               data = Lanczos1, trace = TRUE, algorithm = "plinear",
               start = c(b2 = 0.3, b4 = 5.5, b6 = 7.6)))
## data are an exact fit so the convergence criterion fails
Try(fm4 <- nls(y ~ exp(outer(x,-c(b2, b4, b6))),
               data = Lanczos1, trace = TRUE, algorithm = "plinear",
               start = c(b2 = 0.7, b4 = 4.2, b6 = 6.3)))



