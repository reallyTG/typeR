library(Tsphere)


### Name: TransSphere
### Title: Transposable Sphering Algorithm for Large-Scale Inference.
### Aliases: TransSphere

### ** Examples

#batch-effect simulation
n = 250
p = 50
y = c(rep(1,25),rep(2,25))
mu1true = c(rep(.5,25),rep(-.5,25),rep(0,n-50))
mu2true = c(rep(-.5,25),rep(.5,25),rep(0,n-50))
Smat = cbind(matrix(mu1true,n,p/2),matrix(mu2true,n,p/2))
mus = c(-.5,-.25,0,.25,.5)
Bmatsig = matrix(1,n,1) %*% t(rep(mus,each=10))
Bmat = Bmatsig + matrix(rnorm(n*p)*.75,n,p)
xxt = matrix(rnorm(2*n^2),n,2*n)
Sig = xxt %*% t(xxt)/(2*n); eSig = eigen(Sig);
xx = matrix(rnorm(n*p),n,p)
x.b = Smat + eSig$vectors %*% diag(sqrt(eSig$values)) %*%
eSig$vectors %*% xx + Bmat

#Transposable Sphering Algorithm
ans = TransSphere(x.b,y,fdr=.1,.15,.25)

#significant rows
ans$sig.rows

#true positive rate
sum(ans$sig.rows<=50)/50

#false positive rate
sum(ans$sig.rows>50)/200



