library(qrnn)


### Name: composite.stack
### Title: Reformat data matrices for composite quantile regression
### Aliases: composite.stack

### ** Examples

x <- as.matrix(iris[,"Petal.Length",drop=FALSE])
y <- as.matrix(iris[,"Petal.Width",drop=FALSE])

cases <- order(x)
x <- x[cases,,drop=FALSE]
y <- y[cases,,drop=FALSE]

tau <- seq(0.05, 0.95, by=0.05)
x.y.tau <- composite.stack(x, y, tau)
binary.tau <- dummy.code(as.factor(x.y.tau$tau))

set.seed(1)

# Composite QR
fit.cqr <- qrnn.fit(cbind(binary.tau, x.y.tau$x), x.y.tau$y,
                    tau=x.y.tau$tau, n.hidden=1, n.trials=1,
                    Th=linear, Th.prime=linear.prime)
pred.cqr <- matrix(qrnn.predict(cbind(binary.tau, x.y.tau$x), fit.cqr),
                   ncol=length(tau))
coef.cqr <- lm.fit(cbind(1, x), pred.cqr)$coef
colnames(coef.cqr) <- tau
print(coef.cqr)

# Composite QRNN
fit.cqrnn <- qrnn.fit(x.y.tau$x, x.y.tau$y, tau=x.y.tau$tau,
                      n.hidden=1, n.trials=1, Th=sigmoid,
                      Th.prime=sigmoid.prime)
pred.cqrnn <- qrnn.predict(x.y.tau$x, fit.cqrnn)
pred.cqrnn <- matrix(pred.cqrnn, ncol=length(tau), byrow=FALSE)

matplot(x, pred.cqrnn, col="red", type="l")
points(x, y, pch=20)




