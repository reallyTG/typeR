library(NISTnls)


### Name: Bennett5
### Title: Magentization modelling
### Aliases: Bennett5
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Bennett5)
Try(fm1 <- nls(y ~ b1*(b2+x)**(-1/b3), data = Bennett5,
           start = c(b1 = -2000, b2 = 50, b3 = 0.8), trace = TRUE))
Try(fm1a <- nls(y ~ b1*(b2+x)**(-1/b3), data = Bennett5,
            start = c(b1 = -2000, b2 = 50, b3 = 0.8),
            trace = TRUE, alg = "port"))
Try(fm2 <- nls(y ~ b1*(b2+x)**(-1/b3), data = Bennett5,
           start = c(b1 = -1500, b2 = 45, b3 = 0.85), trace = TRUE))
Try(fm2a <- nls(y ~ b1*(b2+x)**(-1/b3), data = Bennett5,
            start = c(b1 = -1500, b2 = 45, b3 = 0.85),
            trace = TRUE, alg = "port"))
Try(fm3 <- nls(y ~ (b2+x)**(-1/b3), data = Bennett5, alg = "plinear",
           start = c( b2 = 50, b3 = 0.8), trace = TRUE))
Try(fm4 <- nls(y ~ (b2+x)**(-1/b3), data = Bennett5, alg = "plinear",
           start = c( b2 = 45, b3 = 0.8), trace = TRUE))



