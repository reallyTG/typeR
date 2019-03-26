library(NISTnls)


### Name: Misra1a
### Title: Monomolecular Absorption Data
### Aliases: Misra1a
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Misra1a)
Try(fm1 <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) ))
Try(fm1a <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           alg = "port", start = c(b1 = 500, b2 = 0.0001) ))
Try(fm2 <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           start = c(b1 = 250, b2 = 0.0005) ))
Try(fm2a <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           alg = "port", start = c(b1 = 250, b2 = 0.0005) ))
Try(fm3 <- nls(y ~ 1-exp(-b2*x), data = Misra1a, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" ))
Try(fm4 <- nls(y ~ 1-exp(-b2*x), data = Misra1a, trace = TRUE,
           start = c(b2 = 0.0005), algorithm = "plinear" ))

## Using a self-starting model
Try(fm5 <- nls(y ~ SSasympOrig(x, Asym, lrc), data = Misra1a))



