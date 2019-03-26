library(PLSbiplot1)


### Name: PLS.GLM.biplot_no_labels
### Title: The Partial Least Squares (PLS) biplot for Generalized Linear
###   Model (GLM), with the labels of the samples, coefficient points and
###   tick markers excluded
### Aliases: PLS.GLM.biplot_no_labels

### ** Examples

if(require(robustbase))
possum.mat
y = as.matrix(possum.mat[,1], ncol=1)
dimnames(y) = list(paste("S", 1:nrow(possum.mat), seq=""), "Diversity")
X = as.matrix(possum.mat[,2:14], ncol=13)
dimnames(X) = list(paste("S", 1:nrow(possum.mat), seq=""), colnames(possum.mat[,2:14]))
PLS.GLM.biplot_no_labels(X, y, algorithm=PLS.GLM, ax.tickvec.X=rep(5,ncol(X)),
ax.tickvec.y=10, ax.tickvec.b=7)

#Pima.tr data
if(require(MASS))
data(Pima.tr, package="MASS")
X = as.matrix(cbind(Pima.tr[,1:7]))
dimnames(X) = list(1:nrow(X), colnames(X))
y = as.matrix(as.numeric(Pima.tr$type)-1, ncol=1)
#0=No and 1=Yes
dimnames(y) = list(1:nrow(y), paste("type"))
PLS.GLM.biplot_no_labels(X, y, algorithm=PLS.binomial.GLM,
ax.tickvec.X=c(3,3,8,7,8,5,2), ax.tickvec.y=3, ax.tickvec.b=3)



