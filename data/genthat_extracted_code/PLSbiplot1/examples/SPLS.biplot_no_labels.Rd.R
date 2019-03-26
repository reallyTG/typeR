library(PLSbiplot1)


### Name: SPLS.biplot_no_labels
### Title: The Partial Least Squares (PLS) biplot for Sparse Partial Least
###   Squares (SPLS), with the labels of the samples, coefficient points
###   and tick markers excluded
### Aliases: SPLS.biplot_no_labels

### ** Examples

if(require(robustbase))
data(toxicity, package="robustbase")
Y1 = as.matrix(cbind(toxicity$toxicity))
dimnames(Y1) = list(paste(1:nrow(Y1)), "toxicity")
X1 = as.matrix(cbind(toxicity[,2:10]))
rownames(X1) = paste(1:nrow(X1))
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
main2 = opt.penalty.values(X=scale(X1), Y=scale(Y1), A=2, algorithm=mod.SPLS, eps=1e-5,
from.value.X=0, to.value.X=10, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
min.RMSEP.value = main2$min.RMSEP.value
lambdaY.to.use = main2$lambdaY.to.use
lambdaX.to.use = main2$lambdaX.to.use
list(lambdaY.to.use=lambdaY.to.use, lambdaX.to.use=lambdaX.to.use, min.RMSEP.value=min.RMSEP.value)
#SPLS analysis
main3 = mod.SPLS(X=scale(X1), Y=scale(Y1), A=2,
lambdaY=lambdaY.to.use, lambdaX=lambdaX.to.use,
eps=1e-5)
X.to.use = main3$X.select
Y.to.use = main3$Y.select
X.new = as.matrix(X1[,X.to.use])
Y.new = as.matrix(Y1[,Y.to.use])
colnames(Y.new) = colnames(Y1)
SPLS.biplot_no_labels(X.new, Y.new,
algorithm=mod.SPLS, lambdaY=lambdaY.to.use,
lambdaX=lambdaX.to.use, eps=1e-5,
ax.tickvec.X=rep(3,ncol(X.new)),
ax.tickvec.Y=rep(4,ncol(Y.new)))

#ash data
if(require(chemometrics))
data(ash, package="chemometrics")
X1 = as.matrix(ash[,10:17], ncol=8)
Y1 = as.matrix(ash$SOT)
colnames(Y1) = paste("SOT")
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
main2 = opt.penalty.values(X=scale(X1), Y=scale(Y1), A=2, algorithm=mod.SPLS, eps=1e-5,
from.value.X=0, to.value.X=500, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
min.RMSEP.value = main2$min.RMSEP.value
lambdaY.to.use = main2$lambdaY.to.use
lambdaX.to.use = main2$lambdaX.to.use
list(lambdaY.to.use=lambdaY.to.use, lambdaX.to.use=lambdaX.to.use, min.RMSEP.value=min.RMSEP.value)
#SPLS analysis
main3 = mod.SPLS(X=scale(X1), Y=scale(Y1), A=2,
lambdaY=lambdaY.to.use, lambdaX=lambdaX.to.use,
eps=1e-5)
X.to.use = main3$X.select
Y.to.use = main3$Y.select
X.new = as.matrix(X1[,X.to.use])
colnames(X.new)  #P=6
colnames(X1)  #P=8
Y.new = as.matrix(Y1[,Y.to.use])
colnames(Y.new) = colnames(Y1)
colnames(Y.new)
SPLS.biplot_no_labels(X.new, Y.new,
algorithm=mod.SPLS, lambdaY=lambdaY.to.use,
lambdaX=lambdaX.to.use, eps=1e-5,
ax.tickvec.X=rep(1,ncol(X.new)),
ax.tickvec.Y=rep(5,ncol(Y.new)))



