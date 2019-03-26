library(NISTnls)


### Name: Hahn1
### Title: Thermal expansion data
### Aliases: Hahn1
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Hahn1)
Try(fm1 <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
           data = Hahn1, trace = TRUE,
           start = c(b1 = 10, b2 = -1, b3 = 0.05,
             b4 = -0.00001, b5 = -0.05, b6 = 0.001, b7 = -0.000001)))
Try(fm1a <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
           data = Hahn1, trace = TRUE, alg = "port",
           start = c(b1 = 10, b2 = -1, b3 = 0.05,
             b4 = -0.00001, b5 = -0.05, b6 = 0.001, b7 = -0.000001)))
Try(fm2 <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
           data = Hahn1, trace = TRUE,
           start = c(b1 = 1, b2 = -0.1, b3 = 0.005, b4 = -0.000001,
              b5 = -0.005, b6 = 0.0001, b7 = -0.0000001)))
Try(fm2a <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
             data = Hahn1, trace = TRUE, alg = "port",
           start = c(b1 = 1, b2 = -0.1, b3 = 0.005, b4 = -0.000001,
              b5 = -0.005, b6 = 0.0001, b7 = -0.0000001)))
Try(fm3 <- nls(y ~ cbind(1, x, x^2, x^3)/(1+x*(b5+x*(b6+x*b7))),
           data = Hahn1, trace = TRUE, algorithm = "plinear",
           start = c(b5 = -0.05, b6 = 0.001, b7 = -0.000001)))
Try(fm4 <- nls(y ~ cbind(1, x, x^2, x^3)/(1+x*(b5+x*(b6+x*b7))),
           data = Hahn1, trace = TRUE, algorithm = "plinear",
           start = c(b5 = -0.005, b6 = 0.0001, b7 = -0.0000001)))



