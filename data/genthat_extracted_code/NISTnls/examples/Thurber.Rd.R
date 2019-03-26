library(NISTnls)


### Name: Thurber
### Title: Electron mobility data
### Aliases: Thurber
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Thurber)
Try(fm1 <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE,
           start = c(b1 = 1000, b2 = 1000, b3 = 400, b4 = 40,
                     b5 = 0.7, b6 = 0.3, b7 = 0.03)))
Try(fm1a <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, alg = "port", 
           start = c(b1 = 1000, b2 = 1000, b3 = 400, b4 = 40,
                     b5 = 0.7, b6 = 0.3, b7 = 0.03)))
Try(fm2 <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE,
           start = c(b1 = 1300, b2 = 1500, b3 = 500, b4 = 75,
                     b5 = 1, b6 = 0.4, b7 = 0.05)))
Try(fm2a <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, alg = "port", 
           start = c(b1 = 1300, b2 = 1500, b3 = 500, b4 = 75,
                     b5 = 1, b6 = 0.4, b7 = 0.05)))
Try(fm3 <- nls(y ~ outer(x, 0:3, "^")/(1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE,
           start = c(b5 = 0.7, b6 = 0.3, b7 = 0.03), alg = "plinear"))
Try(fm4 <- nls(y ~ outer(x, 0:3, "^")/(1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE,
           start = c(b5 = 1, b6 = 0.4, b7 = 0.05), alg = "plinear"))



