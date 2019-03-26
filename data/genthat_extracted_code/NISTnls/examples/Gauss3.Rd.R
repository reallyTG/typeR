library(NISTnls)


### Name: Gauss3
### Title: Generated data
### Aliases: Gauss3
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Gauss3)
Try(fm1 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
           start = c(b1 = 94.9, b2 = 0.009, b3 = 90.1, b4 = 113, b5 = 20,
                     b6 = 73.8, b7 = 140, b8 = 20)))
Try(fm1a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
                + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
            start = c(b1 = 94.9, b2 = 0.009, b3 = 90.1, b4 = 113, b5 = 20,
                      b6 = 73.8, b7 = 140, b8 = 20), alg = "port"))
Try(fm2 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
           start = c(b1 = 96, b2 = 0.0096, b3 = 80, b4 = 110, b5 = 25,
                     b6 = 74, b7 = 139, b8 = 25)))
Try(fm2a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
           start = c(b1 = 96, b2 = 0.0096, b3 = 80, b4 = 110, b5 = 25,
                     b6 = 74, b7 = 139, b8 = 25), alg = "port"))
Try(fm3 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss3, trace = TRUE,
           start = c(b2 = 0.009, b4 = 113, b5 = 20, b7 = 140, b8 = 20),
           algorithm = "plinear"))
Try(fm4 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss3, trace = TRUE,
           start = c(b2 = 0.0096, b4 = 110, b5 = 25, b7 = 139, b8 = 25),
           algorithm = "plinear"))



