library(NISTnls)


### Name: Gauss1
### Title: Generated data
### Aliases: Gauss1
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Gauss1)
Try(fm1 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss1, trace = TRUE,
            start = c(b1 = 97.0, b2 = 0.009, b3 = 100.0, b4 = 65.0, b5 = 20.0,
                     b6 = 70.0, b7 = 178., b8 = 16.5)))
Try(fm1a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
                + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss1, trace = TRUE,
             start = c(b1 = 97.0, b2 = 0.009, b3 = 100.0, b4 = 65.0, b5 = 20.0,
                     b6 = 70.0, b7 = 178., b8 = 16.5), alg = "port"))
Try(fm2 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss1, trace = TRUE,
           start = c(b1 = 94.0, b2 =  0.0105, b3 = 99.0, b4 = 63.0, b5 = 25.0,
                     b6 = 71.0, b7 = 180.0, b8 = 20.0)))
Try(fm2a <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss1, trace = TRUE,
           start = c(b1 = 94.0, b2 =  0.0105, b3 = 99.0, b4 = 63.0, b5 = 25.0,
                     b6 = 71.0, b7 = 180.0, b8 = 20.0), alg = "port"))
Try(fm3 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss1, trace = TRUE,
           start = c( b2 = 0.009, b4 = 65.0, b5 = 20.0, b7 = 178., b8 = 16.5),
           algorithm = "plinear"))
Try(fm4 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss1, trace = TRUE,
           start = c( b2 = 0.0105, b4 = 63.0, b5 = 25.0, b7 = 180., b8 = 20.0),
           algorithm = "plinear"))



