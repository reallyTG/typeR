library(viopoints)


### Name: viopoints
### Title: 1-D Scatter Plots with Jitter Using Kernel Density Estimates
### Aliases: viopoints viopoints.formula viopoints.default
### Keywords: hplot

### ** Examples

op <- par(mfrow=c(2,2))
gn <- c("SL", "SW", "PL", "PW")
for (i in c("overplot", "stack", "jitter", "violin"))
  viopoints(iris[1:4], method=i, horizontal=TRUE, col=2:5, group.names=gn, 
    main=i)
par(op)

boxplot(Sepal.Length ~ Species, data=iris, ylab="Sepal.Length")
viopoints(Sepal.Length ~ Species, data=iris, col=2:4, add=TRUE)

boxplot(iris[1:4])
viopoints(iris[1:4], groups=iris[5], col=2:4, at=1:4+rep(c(-0.2,0,0.2),each=4),
  jitter=0.1, add=TRUE)
legend("topright", legend=levels(factor(iris[,5])), pch=1, col=2:4)

boxplot(iris[1:4])
viopoints(as.matrix(iris[1:4])~iris[,5], col=2:4, at=1:4,
  lines=TRUE, line.col=c("pink", "lightgreen", "skyblue"), add=TRUE)
legend("topright", legend=levels(factor(iris[,5])), pch=1, col=2:4)

viopoints(iris[c(1,3)], groups=iris[5], method="stack", amount=NA,
  at=rep(1:3,each=2), pch=rep(1:2,3), side=c("n","p"), col=rep(2:3,3), 
  group.names=levels(factor(iris[,5])), main="stack")
legend("topleft", pch=1:2, col=2:3, legend=colnames(iris[c(1,3)]))


## Not run: 
##D viopoints(as.matrix(iris[1:4]) ~ Species, data=iris, jitter=0.3, col=2:4,
##D   axis.par=list(at=1:12, labels=paste(rep(substr(levels(factor(iris[,5])),1,3), 
##D   each=4), c("SL","SW","PL","PW"), sep="."), cex.axis=0.8, las=3))
## End(Not run)



