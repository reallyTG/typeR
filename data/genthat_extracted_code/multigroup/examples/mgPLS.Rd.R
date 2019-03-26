library(multigroup)


### Name: mgPLS
### Title: Multigroup Partial Least Squares Regression
### Aliases: mgPLS

### ** Examples

data(oliveoil)
DataX = oliveoil[,2:6]
DataY = oliveoil[,7:12]
Group = as.factor(oliveoil[,1])
res.mgPLS = mgPLS (DataX, DataY, Group)
barplot(res.mgPLS$noncumper.inertiglobal)
#----- Regression coefficients
#res.mgPLS$coefficients[[2]]
#----- Similarity index: group loadings are compared to the common structure (in  X and Y spaces)
XX1= res.mgPLS$Similarity.noncum.Common.Group.load$X[[1]][-1, 1, drop=FALSE]
XX2=res.mgPLS$Similarity.noncum.Common.Group.load$X[[2]][-1, 1, drop=FALSE]
simX <- cbind(XX1, XX2)
YY1=res.mgPLS$Similarity.noncum.Common.Group.load$Y[[1]][-1, 1, drop=FALSE]
YY2=res.mgPLS$Similarity.noncum.Common.Group.load$Y[[2]][-1, 1, drop=FALSE]
simY <- cbind(YY1,YY2)
XLAB = paste("Dim1, %",res.mgPLS$noncumper.inertiglobal[1])
YLAB = paste("Dim1, %",res.mgPLS$noncumper.inertiglobal[2])
plot(simX[, 1], simX[, 2], pch=15, xlim=c(0, 1), ylim=c(0, 1), main="Similarity indices in X space",
     xlab=XLAB, ylab=YLAB)
abline(h=seq(0, 1, by=0.2), col="black", lty=3)
text(simX[, 1], simX[, 2], labels=rownames(simX), pos=2)
plot(simY[, 1], simY[, 2], pch=15, xlim=c(0, 1), ylim=c(0, 1), main="Similarity indices in Y space",
     xlab=XLAB, ylab=YLAB)
abline(h=seq(0, 1, by=0.2), col="black", lty=3)
text(simY[, 1], simY[, 2], labels=rownames(simY), pos=2)



