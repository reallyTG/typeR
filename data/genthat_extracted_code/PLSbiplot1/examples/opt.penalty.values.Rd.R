library(PLSbiplot1)


### Name: opt.penalty.values
### Title: Choosing a value for penalty parameters lambdaX and lambdaY for
###   the Sparse Partial Least Squares (SPLS) and Sparse Partial Least
###   Squares-Generalized Linear Model (SPLS-GLM) analyses
### Aliases: opt.penalty.values

### ** Examples

if(require(chemometrics))
data(ash, package="chemometrics")
X1 = as.matrix(ash[,10:17], ncol=8)
Y1 = as.matrix(ash$SOT)
colnames(Y1) = paste("SOT")
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
opt.penalty.values(X=scale(X1), Y=scale(Y1), A=2, algorithm=mod.SPLS, eps=1e-5,
from.value.X=0, to.value.X=500, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
#thus, use lambdaX = 10.10 and lambdaY = 0 for the SPLS analysis of this data

#possum.mat data
if(require(robustbase))
possum.mat
y = as.matrix(possum.mat[,1], ncol=1)
dimnames(y) = list(paste("S", 1:nrow(possum.mat), seq=""), "Diversity")
X = as.matrix(possum.mat[,2:14], ncol=13)
dimnames(X) = list(paste("S", 1:nrow(possum.mat), seq=""), colnames(possum.mat[,2:14]))
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
opt.penalty.values(X=scale(X), Y=scale(y), A=2, algorithm=SPLS.GLM, eps=1e-3,
from.value.X=1, to.value.X=4, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
#thus, use lambdaY = 0 and lambdaX = 3.3 for the (Poisson) SPLS-GLM analysis of this data

#Pima.tr data
if(require(MASS))
data(Pima.tr, package="MASS")
X = as.matrix(cbind(Pima.tr[,1:7]))
dimnames(X) = list(1:nrow(X), colnames(X))
y = as.matrix(as.numeric(Pima.tr$type)-1, ncol=1)
#0=No and 1=Yes
dimnames(y) = list(1:nrow(y), paste("type"))
#choosing a value for the penalty parameters lambdaY and lambdaX for this data
opt.penalty.values(X=scale(X), Y=scale(y), A=2, algorithm=SPLS.binomial.GLM, eps=1e-3,
from.value.X=0, to.value.X=95, from.value.Y=0, to.value.Y=0, lambdaY.len=1, lambdaX.len=100)
#thus, use lambdaY = 0 and lambdaX = 0.96 for the (Binomial) SPLS-GLM analysis of this data



