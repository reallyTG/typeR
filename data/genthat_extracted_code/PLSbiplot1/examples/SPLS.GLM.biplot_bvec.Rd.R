library(PLSbiplot1)


### Name: SPLS.GLM.biplot_bvec
### Title: A zoomed-in display of the coefficient points in the Partial
###   Least Squares (PLS) biplot for Sparse Partial Least
###   Squares-Generalized Linear Model (SPLS-GLM)
### Aliases: SPLS.GLM.biplot_bvec

### ** Examples

if(require(robustbase))
possum.mat
y = as.matrix(possum.mat[,1], ncol=1)
dimnames(y) = list(paste("S", 1:nrow(possum.mat), seq=""), "Diversity")
X = as.matrix(possum.mat[,2:14], ncol=13)
dimnames(X) = list(paste("S", 1:nrow(possum.mat), seq=""), colnames(possum.mat[,2:14]))
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
main2B = opt.penalty.values(X=scale(X), Y=scale(y), A=2, algorithm=SPLS.GLM, eps=1e-3,
from.value.X=1, to.value.X=4, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
min.RMSEP.value = main2B$min.RMSEP.value
lambdaY.to.use = main2B$lambdaY.to.use
lambdaX.to.use = main2B$lambdaX.to.use
list(lambdaY.to.use=lambdaY.to.use, lambdaX.to.use=lambdaX.to.use, min.RMSEP.value=min.RMSEP.value)
#SPLS-GLM analysis
main3 = SPLS.GLM(scale(X), scale(y), A=2, lambdaY=lambdaY.to.use, lambdaX=lambdaX.to.use, eps=1e-3)
X.to.use = main3$X.select
X.new = as.matrix(X[,names(X.to.use)])
colnames(X.new)
main3$Y.select #note
SPLS.GLM.biplot_bvec(X.new, y, algorithm=SPLS.GLM, eps=1e-3, lambdaY=lambdaY.to.use,
lambdaX=lambdaX.to.use, ax.tickvec.b=30)

#Pima.tr data
if(require(MASS))
data(Pima.tr, package="MASS")
X = as.matrix(cbind(Pima.tr[,1:7]))
dimnames(X) = list(1:nrow(X), colnames(X))
y = as.matrix(as.numeric(Pima.tr$type)-1, ncol=1)
#0=No and 1=Yes
dimnames(y) = list(1:nrow(y), paste("type"))
main2 = opt.penalty.values(X=scale(X), Y=scale(y), A=2, algorithm=SPLS.binomial.GLM, eps=1e-3,
from.value.X=0, to.value.X=95, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
min.RMSEP.value = main2$min.RMSEP.value
lambdaY.to.use = main2$lambdaY.to.use
lambdaX.to.use = main2$lambdaX.to.use
#SPLS-GLM analysis
main3 = SPLS.binomial.GLM(scale(X), scale(y), A=2, lambdaY=lambdaY.to.use, lambdaX=lambdaX.to.use,
eps=1e-3)
X.to.use = main3$X.select
X.new = as.matrix(X[,names(X.to.use)])
colnames(X.new)
SPLS.GLM.biplot_bvec(X.new, y, algorithm=SPLS.binomial.GLM, eps=1e-3, lambdaY=lambdaY.to.use,
lambdaX=lambdaX.to.use, ax.tickvec.b=30)



