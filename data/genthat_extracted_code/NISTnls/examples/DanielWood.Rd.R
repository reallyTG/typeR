library(NISTnls)


### Name: DanielWood
### Title: Radiated energy
### Aliases: DanielWood
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = DanielWood)
Try(fm1 <- nls(y ~ b1*x**b2, data = DanielWood, trace = TRUE,
            start = c(b1 = 1, b2 = 5)))
Try(fm1a <- nls(y ~ b1*x**b2, data = DanielWood, trace = TRUE,
            start = c(b1 = 1, b2 = 5), alg = "port"))
Try(fm2 <- nls(y ~ b1*x**b2, data = DanielWood, trace = TRUE,
            start = c(b1 = 0.7, b2 = 4)))
Try(fm2a <- nls(y ~ b1*x**b2, data = DanielWood, trace = TRUE,
            start = c(b1 = 0.7, b2 = 4), alg = "port"))
Try(fm3 <- nls(y ~ x**b2, data = DanielWood, trace = TRUE,
            start = c(b2 = 5), algorithm = "plinear"))
Try(fm4 <- nls(y ~ x**b2, data = DanielWood, trace = TRUE,
            start = c(b2 = 4), algorithm = "plinear"))



