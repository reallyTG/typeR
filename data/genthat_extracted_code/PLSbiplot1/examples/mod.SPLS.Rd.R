library(PLSbiplot1)


### Name: mod.SPLS
### Title: Sparse Partial Least Squares (SPLS) algorithm
### Aliases: mod.SPLS

### ** Examples

if(require(chemometrics))
data(ash, package="chemometrics")
X1 = as.matrix(ash[,10:17], ncol=8)
Y1 = as.matrix(ash$SOT)
colnames(Y1) = paste("SOT")
mod.SPLS(X=scale(X1), Y=scale(Y1), A=2, lambdaY=0, lambdaX=10.10, eps=1e-5)
#lambdaX and lambdaY value are determined using function opt.penalty.values
#for more details, see opt.penalty.values help file



