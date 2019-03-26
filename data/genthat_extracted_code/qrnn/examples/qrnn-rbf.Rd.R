library(qrnn)


### Name: qrnn.rbf
### Title: Radial basis function kernel
### Aliases: qrnn.rbf

### ** Examples

x <- as.matrix(iris[,"Petal.Length",drop=FALSE])
y <- as.matrix(iris[,"Petal.Width",drop=FALSE])

cases <- order(x)
x <- x[cases,,drop=FALSE]
y <- y[cases,,drop=FALSE]

set.seed(1)
kern <- qrnn.rbf(x, x.basis=x, sigma=1)

parms <- qrnn.fit(x=kern, y=y, tau=0.5, penalty=0.1,
                  Th=linear, Th.prime=linear.prime,
                  iter.max=500, n.trials=1)
p <- qrnn.predict(x=kern, parms=parms)

matplot(x, cbind(y, p), type=c("p", "l"), pch=1, lwd=1)



