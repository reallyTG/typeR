library(NISTnls)


### Name: Ratkowsky3
### Title: Onion growth data
### Aliases: Ratkowsky3
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Ratkowsky3)

## causes NA/NaN/Inf error
Try(fm1 <- nls(y ~ b1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b1 = 100, b2 = 10, b3 = 1, b4 = 1),
           trace = TRUE))
Try(fm1a <- nls(y ~ b1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b1 = 100, b2 = 10, b3 = 1, b4 = 1),
           alg = "port", trace = TRUE))

Try(fm2 <- nls(y ~ b1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b1 = 700, b2 = 5, b3 = 0.75, b4 = 1.3),
           trace = TRUE))
Try(fm2a <- nls(y ~ b1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b1 = 700, b2 = 5, b3 = 0.75, b4 = 1.3),
           alg = "port", trace = TRUE))

Try(fm3 <- nls(y ~ 1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b2 = 10, b3 = 1, b4 = 1), algorithm = "plinear",
           trace = TRUE))
Try(fm4 <- nls(y ~ 1 / ((1+exp(b2-b3*x))**(1/b4)), data = Ratkowsky3,
           start = c(b2 = 5, b3 = 0.75, b4 = 1.3), algorithm = "plinear",
           trace = TRUE))



