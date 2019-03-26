library(NISTnls)


### Name: Kirby2
### Title: Microscope line width standards
### Aliases: Kirby2
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Kirby2)
Try(fm1 <- nls(y ~ (b1 + b2*x + b3*x**2) / (1 + b4*x + b5*x**2),
           data = Kirby2, trace = TRUE,
           start = c(b1 = 2, b2 = -0.1, b3 = 0.003,
                     b4 = -0.001, b5 = 0.00001)))
Try(fm1a <- nls(y ~ (b1 + b2*x + b3*x**2) / (1 + b4*x + b5*x**2),
           data = Kirby2, trace = TRUE, alg = "port",
           start = c(b1 = 2, b2 = -0.1, b3 = 0.003,
                     b4 = -0.001, b5 = 0.00001)))
Try(fm2 <- nls(y ~ (b1 + b2*x + b3*x**2) / (1 + b4*x + b5*x**2),
           data = Kirby2, trace = TRUE,
           start = c(b1 = 1.5, b2 = -0.15, b3 = 0.0025,
                     b4 = -0.0015, b5 = 0.00002)))
Try(fm2a <- nls(y ~ (b1 + b2*x + b3*x**2) / (1 + b4*x + b5*x**2),
             data = Kirby2, trace = TRUE, alg = "port",
             start = c(b1 = 1.5, b2 = -0.15, b3 = 0.0025,
                       b4 = -0.0015, b5 = 0.00002)))
Try(fm3 <- nls(y ~ cbind(1, x, x**2)/(1 + x*(b4 + b5*x)),
           data = Kirby2, trace = TRUE, algorithm = "plinear",
           start = c(b4 = -0.001, b5 = 0.00001)))
Try(fm4 <- nls(y ~ cbind(1, x, x**2)/(1 + x*(b4 + b5*x)),
           data = Kirby2, trace = TRUE, algorithm = "plinear",
           start = c(b4 = -0.0015, b5 = 0.00002)))



