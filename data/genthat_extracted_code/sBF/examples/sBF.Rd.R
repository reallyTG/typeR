library(sBF)


### Name: sBF
### Title: Smooth Backfitting Estimator
### Aliases: sBF

### ** Examples

X <- matrix(rnorm(1000), ncol=2)
MX1 <- X[,1]^3
MX2 <- sin(X[,2])
Y <- MX1 + MX2
data <- cbind(Y, X)
  
est <- sBF(data)

par(mfrow=c(1, 2))
plot(est$grid[,1],est$mxhat[,1], type="l",
     ylab=expression(m[1](x[1])), xlab=expression(x[1]))
curve(x^3, add=TRUE, col="red")
plot(est$grid[,2],est$mxhat[,2], type="l",
     ylab=expression(m[2](x[2])), xlab=expression(x[2]))
curve(sin(x), add=TRUE, col="red")
par(mfrow=c(1, 1))



