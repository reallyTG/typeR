library(MatrixLDA)


### Name: MatLDA
### Title: Fits the J-class penalized matrix-normal model for a single pair
###   of tuning parameters.
### Aliases: MatLDA

### ** Examples

## Generate realizations of matrix-normal random variables
## set sample size, dimensionality, number of classes, 
## and marginal class probabilities

N = 75
N.test = 150
N.val = 75

N.total = N + N.test + N.val

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
set.seed(10)
dat.array = array(0, dim=c(r,p,N.total))
	class.total = numeric(length=N.total)
	for(jj in 1:N.total){
		class.total[jj] = sample(1:C, 1, prob=pi.list)
		dat.array[,,jj] = tcrossprod(crossprod(Uinv.sqrt, 
		matrix(rnorm(r*p), nrow=r)),
		Vinv.sqrt) + M.array[,,class.total[jj]]
	}

## store generated data 
X = dat.array[,,1:N]
X.val = dat.array[,,(N+1):(N+N.val)]
X.test = dat.array[,,(N+N.val+1):N.total]

class = class.total[1:N]
class.val = class.total[(N+1):(N+N.val)]
class.test = class.total[(N+N.val+1):N.total]

## fit two-dimensional grid of tuning parameters; 
## measure classification accuracy on validation set
lambda1 = c(2^seq(-5, 0, by=1))
lambda2 = c(2^seq(-8, -4, by=1))
fit.grid = MatLDA_Grid(X=X, class=class, lambda1=lambda1, 
	lambda2=lambda2, quiet=TRUE,
	Xval=X.val, classval= class.val,
	k.iter = 100, cov.tol=1e-5, m.tol=1e-5, full.tol=1e-6)

## identify minimum misclassification proportion; 
## select tuning parameters corresponding to 
## smallest model at minimum misclassification proportion
CV.mat = fit.grid$Val.mat
G.mat = fit.grid$G.mat*(CV.mat==min(CV.mat))
ind1 = (which(G.mat==max(G.mat), arr.ind=TRUE))[,2]
ind2 = (which(G.mat==max(G.mat), arr.ind=TRUE))[,1]
out = unique(ind2[which(ind2==max(ind2))])
lambda1.cv = lambda1[out]
out2 = unique(max(ind1[ind2==out]))
lambda2.cv = lambda2[out2]

## refit model with sinlge tuning parameter pair
out = MatLDA(X=X, class=class, lambda1=lambda1.cv, 
	lambda2=lambda2.cv, quiet=FALSE,
	Xval=X.test, classval= class.test,
	k.iter = 100, cov.tol=1e-5, m.tol=1e-5, full.tol=1e-6)

## print misclassification proportion on test set 
out$Val

## print images of estimated mean differences
dev.new(width=10, height=3)
par(mfrow=c(1,3))
image(t(abs(out$M[,,1] - out$M[,,2]))[,r:1], 
main=expression(paste("|", hat(mu)[1], "-", hat(mu)[2], "|")),
 col = grey(seq(1, 0, length = 100)))
image(t(abs(out$M[,,1] - out$M[,,3]))[,r:1], 
main=expression(paste("|", hat(mu)[1], "-", hat(mu)[3], "|")),
 col = grey(seq(1, 0, length = 100)))
image(t(abs(out$M[,,2] - out$M[,,3]))[,r:1], 
main=expression(paste("|", hat(mu)[2], "-", hat(mu)[3], "|")),
 col = grey(seq(1, 0, length = 100)))




