library(qrnn)


### Name: qrnn.predict
### Title: Evaluate quantiles from trained QRNN model
### Aliases: qrnn.predict

### ** Examples

x <- as.matrix(iris[,"Petal.Length",drop=FALSE])
y <- as.matrix(iris[,"Petal.Width",drop=FALSE])

cases <- order(x)
x <- x[cases,,drop=FALSE]
y <- y[cases,,drop=FALSE]
y[y < 0.5] <- 0.5

set.seed(1)
parms <- qrnn.fit(x=x, y=y, n.hidden=3, tau=0.5, lower=0.5,
                  iter.max=500, n.trials=1)
p <- qrnn.predict(x=x, parms=parms)

matplot(x, cbind(y, p), type=c("p", "l"), pch=1, lwd=1)



