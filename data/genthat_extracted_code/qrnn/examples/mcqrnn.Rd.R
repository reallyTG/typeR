library(qrnn)


### Name: mcqrnn
### Title: Monotone composite quantile regression neural network (MCQRNN)
###   for simultaneous estimation of multiple non-crossing quantiles
### Aliases: mcqrnn mcqrnn.fit mcqrnn.predict

### ** Examples

x <- as.matrix(iris[,"Petal.Length",drop=FALSE])
y <- as.matrix(iris[,"Petal.Width",drop=FALSE])

cases <- order(x)
x <- x[cases,,drop=FALSE]
y <- y[cases,,drop=FALSE]

set.seed(1)

## MCQRNN model w/ 2 hidden layers for simultaneous estimation of
## multiple non-crossing quantile functions
fit.mcqrnn <- mcqrnn.fit(x, y, tau=seq(0.1, 0.9, by=0.1),
                         n.hidden=2, n.hidden2=2, n.trials=1,
                         iter.max=500)
pred.mcqrnn <- mcqrnn.predict(x, fit.mcqrnn)

matplot(x, pred.mcqrnn, col="blue", type="l")
points(x, y)




