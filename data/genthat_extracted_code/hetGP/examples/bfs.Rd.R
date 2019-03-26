library(hetGP)


### Name: bfs
### Title: Bayes Factor Data
### Aliases: bfs bfs.exp bfs.gamma
### Keywords: datasets datagen

### ** Examples

data(bfs)

##
## Exponential version first
##

thetas <- matrix(bfs.exp$theta, ncol=1)
bfs <- as.matrix(t(bfs.exp[,-1]))

## the data are heavy tailed, so t-errors help
bfs1 <- mleHetTP(X=list(X0=log10(thetas), Z0=colMeans(log(bfs)),
  mult=rep(nrow(bfs), ncol(bfs))), Z=log(as.numeric(bfs)), lower=10^(-4), 
  upper=5, covtype="Matern5_2")

## predictions on a grid in 1d
dx <- seq(0,1,length=100)
dx <- 10^(dx*4 - 3)
p <- predict(bfs1, matrix(log10(dx), ncol=1))

## visualization
matplot(log10(thetas), t(log(bfs)), col=1, pch=21, ylab="log(bf)", 
  main="Bayes factor surface")
lines(log10(dx), p$mean, lwd=2, col=2)
lines(log10(dx), p$mean + 2*sqrt(p$sd2 + p$nugs), col=2, lty=2, lwd=2)
lines(log10(dx), p$mean - 2*sqrt(p$sd2 + p$nugs), col=2, lty=2, lwd=2)
legend("topleft", c("hetTP mean", "hetTP interval"), lwd=2, lty=1:2, col=2)

##
## Now Gamma version
##

D <- as.matrix(bfs.gamma[,1:2])
bfs <- as.matrix(t(bfs.gamma[,-(1:2)]))

## fitting in 2fd
bfs2 <- mleHetTP(X=list(X0=log10(D), Z0=colMeans(log(bfs)), 
  mult=rep(nrow(bfs), ncol(bfs))), Z = log(as.numeric(bfs)), 
  lower = rep(10^(-4), 2), upper = rep(5, 2), covtype = "Matern5_2", 
  maxit=100000)

## predictions on a grid in 2d
dx <- seq(0,1,length=100)
dx <- 10^(dx*4 - 3)
DD <- as.matrix(expand.grid(dx, dx))
p <- predict(bfs2, log10(DD))

## visualization via image-contour plots
par(mfrow=c(1,2))
mbfs <- colMeans(bfs)
image(log10(dx), log10(dx), t(matrix(p$mean, ncol=length(dx))),  
  col=heat.colors(128), xlab="log10 alpha", ylab="log10 beta", 
  main="mean log BF")
text(log10(D[,2]), log10(D[,1]), signif(log(mbfs), 2), cex=0.5)
contour(log10(dx), log10(dx),t(matrix(p$mean, ncol=length(dx))),
  levels=c(-5,-3,-1,0,1,3,5), add=TRUE, col=4)
image(log10(dx), log10(dx), t(matrix(sqrt(p$sd2 + p$nugs), 
  ncol=length(dx))),  col=heat.colors(128), xlab="log10 alpha", 
  ylab="log10 beta", main="sd log BF")
text(log10(D[,2]), log10(D[,1]), signif(apply(log(bfs), 2, sd), 2), 
  cex=0.5)



