library(NISTnls)


### Name: Misra1c
### Title: Monomolecular Absorption data
### Aliases: Misra1c
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Misra1c)
Try(fm1 <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) ))
Try(fm1a <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           alg = "port", start = c(b1 = 500, b2 = 0.0001) ))
Try(fm2 <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           start = c(b1 = 600, b2 = 0.0002) ))
Try(fm2a <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           alg = "port", start = c(b1 = 600, b2 = 0.0002) ))
Try(fm3 <- nls(y ~ 1-(1+2*b2*x)**(-.5), data = Misra1c, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" ))
Try(fm4 <- nls(y ~ 1-(1+2*b2*x)**(-.5), data = Misra1c, trace = TRUE,
           start = c(b2 = 0.0002), algorithm = "plinear" ))



