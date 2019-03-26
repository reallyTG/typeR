library(NISTnls)


### Name: Lanczos3
### Title: Generated data
### Aliases: Lanczos3
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Lanczos3)
## plot log response to see the number of exponential terms
plot(y ~ x, data = Lanczos3, log = "y")
Try(fm1 <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos3, trace = TRUE,
           start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6, b4 = 5.5,
                     b5 = 6.5, b6 = 7.6)))
Try(fm1a <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos3, trace = TRUE, alg = "port",
           start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6, b4 = 5.5,
                     b5 = 6.5, b6 = 7.6)))
Try(fm2 <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos3, trace = TRUE,
           start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6, b4 = 4.2,
                     b5 = 4, b6 = 6.3)))
Try(fm2a <- nls(y ~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
           data = Lanczos3, trace = TRUE, alg = "port",
           start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6, b4 = 4.2,
                     b5 = 4, b6 = 6.3)))
Try(fm3 <- nls(y ~ exp(outer(x,-c(b2, b4, b6))),
           data = Lanczos3, trace = TRUE, algorithm = "plinear",
           start = c(b2 = 0.3, b4 = 5.5, b6 = 7.6)))
Try(fm4 <- nls(y ~ exp(outer(x,-c(b2, b4, b6))),
           data = Lanczos3, trace = TRUE, algorithm = "plinear",
           start = c(b2 = 0.7, b4 = 4.2, b6 = 6.3)))
## Use analytic derivatives
Lanczos <- deriv(~ b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x),
                 paste("b", 1:6, sep = ""),
                 function(x, b1, b2, b3, b4, b5, b6){})
Try(fm5 <- nls(y ~ Lanczos(x, b1, b2, b3, b4, b5, b6),
           data = Lanczos3, trace = TRUE,
           start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6, b4 = 5.5,
                     b5 = 6.5, b6 = 7.6)))
Try(fm5a <- nls(y ~ Lanczos(x, b1, b2, b3, b4, b5, b6),
           data = Lanczos3, trace = TRUE, alg = "port",
           start = c(b1 = 1.2, b2 = 0.3, b3 = 5.6, b4 = 5.5,
                     b5 = 6.5, b6 = 7.6)))
Try(fm6 <- nls(y ~ Lanczos(x, b1, b2, b3, b4, b5, b6),
           data = Lanczos3, trace = TRUE,
           start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6, b4 = 4.2,
                     b5 = 4, b6 = 6.3)))
Try(fm6a <- nls(y ~ Lanczos(x, b1, b2, b3, b4, b5, b6),
           data = Lanczos3, trace = TRUE, alg = "port",
           start = c(b1 = 0.5, b2 = 0.7, b3 = 3.6, b4 = 4.2,
                     b5 = 4, b6 = 6.3)))



