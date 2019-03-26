library(PLSbiplot1)


### Name: SPLS.binomial.GLM
### Title: Sparse Partial Least Squares-Generalized Linear Model (SPLS-GLM)
###   algorithm for Binomial y
### Aliases: SPLS.binomial.GLM

### ** Examples

if(require(MASS))
data(Pima.tr, package="MASS")
X = as.matrix(cbind(Pima.tr[,1:7]))
dimnames(X) = list(1:nrow(X), colnames(X))
y = as.matrix(as.numeric(Pima.tr$type)-1, ncol=1)
#0=No and 1=Yes
dimnames(y) = list(1:nrow(y), paste("type"))
SPLS.binomial.GLM(scale(X), scale(y), A=2, lambdaY=0, lambdaX=0.96, eps=1e-3)
#lambdaX and lambdaY value are determined using function opt.penalty.values
#for more details, see opt.penalty.values help file



