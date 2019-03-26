library(NISTnls)


### Name: Misra1b
### Title: Monomolecular Absorption Data
### Aliases: Misra1b
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Misra1b)
Try(fm1 <- nls(y ~ b1 * (1-(1+b2*x/2)**(-2)), data = Misra1b, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) ))
Try(fm1a <- nls(y ~ b1 * (1-(1+b2*x/2)**(-2)), data = Misra1b, trace = TRUE,
           alg = "port", start = c(b1 = 500, b2 = 0.0001) ))
Try(fm2 <- nls(y ~ b1 * (1-(1+b2*x/2)**(-2)), data = Misra1b, trace = TRUE,
           start = c(b1 = 300, b2 = 0.0002) ))
Try(fm2a <- nls(y ~ b1 * (1-(1+b2*x/2)**(-2)), data = Misra1b, trace = TRUE,
           alg = "port", start = c(b1 = 300, b2 = 0.0002) ))
Try(fm3 <- nls(y ~ 1-(1+b2*x/2)**(-2), data = Misra1b, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" ))
Try(fm4 <- nls(y ~ 1-(1+b2*x/2)**(-2), data = Misra1b, trace = TRUE,
           start = c(b2 = 0.0005), algorithm = "plinear" ))



