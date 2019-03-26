library(PLSbiplot1)


### Name: SPLS.GLM
### Title: Sparse Partial Least Squares-Generalized Linear Model (SPLS-GLM)
###   algorithm
### Aliases: SPLS.GLM

### ** Examples

if(require(robustbase))
possum.mat
y = as.matrix(possum.mat[,1], ncol=1)
dimnames(y) = list(paste("S", 1:nrow(possum.mat), seq=""), "Diversity")
X = as.matrix(possum.mat[,2:14], ncol=13)
dimnames(X) = list(paste("S", 1:nrow(possum.mat), seq=""), colnames(possum.mat[,2:14]))
SPLS.GLM(scale(X), scale(y), A=2, lambdaY=0, lambdaX=3.3, eps=1e-3)
#lambdaX and lambdaY value are determined using function opt.penalty.values
#for more details, see opt.penalty.values help file



