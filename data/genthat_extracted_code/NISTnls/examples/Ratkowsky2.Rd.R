library(NISTnls)


### Name: Ratkowsky2
### Title: Pasture yield data
### Aliases: Ratkowsky2
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Ratkowsky2)

Try(fm1 <- nls(y ~ b1 / (1+exp(b2-b3*x)), data = Ratkowsky2, trace = TRUE,
           start = c(b1 = 100, b2 = 1, b3 = 0.1)))
Try(fm1a <- nls(y ~ b1 / (1+exp(b2-b3*x)), data = Ratkowsky2,
            trace = TRUE, alg = "port", 
            start = c(b1 = 100, b2 = 1, b3 = 0.1)))
Try(fm2 <- nls(y ~ b1 / (1+exp(b2-b3*x)), data = Ratkowsky2, trace = TRUE,
           start = c(b1 = 75, b2 = 2.5, b3 = 0.07)))
Try(fm2a <- nls(y ~ b1 / (1+exp(b2-b3*x)), data = Ratkowsky2,
            trace = TRUE, alg = "port", 
            start = c(b1 = 75, b2 = 2.5, b3 = 0.07)))
Try(fm3 <- nls(y ~ 1 / (1+exp(b2-b3*x)), data = Ratkowsky2, trace = TRUE,
           start = c(b2 = 1, b3 = 0.1), alg = "plinear"))
Try(fm4 <- nls(y ~ 1 / (1+exp(b2-b3*x)), data = Ratkowsky2, trace = TRUE,
           start = c(b2 = 2.5, b3 = 0.07), alg = "plinear"))

## Using a self-starting model
Try(fm5 <- nls(y ~ SSlogis(x, Asym, xmid, scal), data = Ratkowsky2))
summary(fm5)



