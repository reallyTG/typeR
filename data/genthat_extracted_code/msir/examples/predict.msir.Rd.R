library(msir)


### Name: predict.msir
### Title: Model-based Sliced Inverse Regression directions
### Aliases: predict.msir

### ** Examples

n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- exp(0.5 * x%*%b) + 0.1*rnorm(n)
pairs(cbind(y,x), gap = 0)

MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, which = 1, type = "2Dplot")
all.equal(predict(MSIR), MSIR$dir)
predict(MSIR, dim = 1:2)

x0 <- matrix(rnorm(n*p), nrow = n, ncol = p)
y0 <- exp(0.5 * x0%*%b) + 0.1*rnorm(n)
plot(predict(MSIR, dim = 1, newdata = x0), y0)



