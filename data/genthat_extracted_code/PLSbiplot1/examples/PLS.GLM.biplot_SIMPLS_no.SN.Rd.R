library(PLSbiplot1)


### Name: PLS.GLM.biplot_SIMPLS_no.SN
### Title: The Partial Least Squares (PLS) biplot for Generalized Linear
###   Model (GLM) fitted using the SIMPLS algorithm, with the labels of the
###   sample points excluded
### Aliases: PLS.GLM.biplot_SIMPLS_no.SN

### ** Examples

if(require(robustbase))
possum.mat
y = as.matrix(possum.mat[,1], ncol=1)
dimnames(y) = list(paste("S", 1:nrow(possum.mat), seq=""), "Diversity")
X = as.matrix(possum.mat[,2:14], ncol=13)
dimnames(X) = list(paste("S", 1:nrow(possum.mat), seq=""), colnames(possum.mat[,2:14]))
#Poisson-fitted
PLS.GLM.biplot_SIMPLS_no.SN(X, y, algorithm=PLS.GLM,
ax.tickvec.X=rep(5,ncol(X)), ax.tickvec.y=10, ax.tickvec.b=7)



