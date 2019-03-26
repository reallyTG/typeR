library(NISTnls)


### Name: Gauss2
### Title: Generated data
### Aliases: Gauss2
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Gauss2)
Try(fm1 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
           start = c(b1 = 96, b2 = 0.009, b3 = 103, b4 = 106, b5 = 18,
                     b6 = 72, b7 = 151, b8 = 18)))
Try(fm1a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
             start = c(b1 = 96, b2 = 0.009, b3 = 103, b4 = 106, b5 = 18,
                       b6 = 72, b7 = 151, b8 = 18), alg = "port"))
Try(fm2 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
           start = c(b1 = 98, b2 = 0.0105, b3 = 103, b4 = 105, b5 = 20,
                     b6 = 73, b7 = 150, b8 = 20)))
Try(fm2a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
           start = c(b1 = 98, b2 = 0.0105, b3 = 103, b4 = 105, b5 = 20,
                     b6 = 73, b7 = 150, b8 = 20), alg = "port"))
Try(fm3 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss2, trace = TRUE,
           start = c(b2 = 0.009, b4 = 106, b5 = 18, b7 = 151, b8 = 18),
           algorithm = "plinear"))
Try(fm4 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss2, trace = TRUE,
           start = c(b2 = 0.0105, b4 = 105, b5 = 20, b7 = 150, b8 = 20),
           algorithm = "plinear"))



