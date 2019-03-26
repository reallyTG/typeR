library(MatrixLDA)


### Name: MN_MLE
### Title: Matrix-normal maximum likelihood estimator
### Aliases: MN_MLE

### ** Examples

## Generate realizations of matrix-normal random variables
## set sample size, dimensionality, number of classes, 
## and marginal class probabilities

N = 75
N.test = 150

N.total = N + N.test

r = 16
p = 16
C = 3

pi.list = rep(1/C, C)

## create class means
M.array = array(0, dim=c(r, p, C))
M.array[3:4, 3:4, 1] = 1
M.array[5:6, 5:6, 2] = .5
M.array[3:4, 3:4, 3] = -2
M.array[5:6, 5:6, 3] = -.5


## create covariance matrices U and V
Uinv = matrix(0, nrow=r, ncol=r)
for (i in 1:r) {
	for (j in 1:r) {
		Uinv[i,j] = .5^abs(i-j)
	}
}

eoU = eigen(Uinv)
Uinv.sqrt = tcrossprod(tcrossprod(eoU$vec, 
diag(eoU$val^(1/2))),eoU$vec)

Vinv = matrix(.5, nrow=p, ncol=p)
diag(Vinv) = 1 
eoV = eigen(Vinv)
Vinv.sqrt = tcrossprod(tcrossprod(eoV$vec, 
diag(eoV$val^(1/2))),eoV$vec)

## generate N.total realizations of matrix-variate normal data
set.seed(1)
X = array(0, dim=c(r,p,N.total))
	class = numeric(length=N.total)
	for(jj in 1:N.total){
		class[jj] = sample(1:C, 1, prob=pi.list)
		X[,,jj] = tcrossprod(crossprod(Uinv.sqrt, 
		matrix(rnorm(r*p), nrow=r)),
		Vinv.sqrt) + M.array[,,class[jj]]
	}

## fit matrix-normal model using maximum likelihood
out = MN_MLE(X = X, class = class)



