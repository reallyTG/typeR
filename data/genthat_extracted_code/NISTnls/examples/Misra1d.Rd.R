library(NISTnls)


### Name: Misra1d
### Title: Monomolecular Absorption data
### Aliases: Misra1d
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Misra1d)
Try(fm1 <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) ))
Try(fm1a <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           alg = "port", start = c(b1 = 500, b2 = 0.0001) ))
Try(fm2 <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b1 = 450, b2 = 0.0003) ))
Try(fm2a <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           alg = "port", start = c(b1 = 450, b2 = 0.0003) ))
Try(fm3 <- nls(y ~ b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" ))
Try(fm4 <- nls(y ~ b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b2 = 0.0005), algorithm = "plinear" ))



