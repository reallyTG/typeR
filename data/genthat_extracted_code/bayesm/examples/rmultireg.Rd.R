library(bayesm)


### Name: rmultireg
### Title: Draw from the Posterior of a Multivariate Regression
### Aliases: rmultireg
### Keywords: regression

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

n =200
m = 2
X = cbind(rep(1,n),runif(n))
k = ncol(X)
B = matrix(c(1,2,-1,3), ncol=m)
Sigma = matrix(c(1, 0.5, 0.5, 1), ncol=m)
RSigma = chol(Sigma)
Y = X%*%B + matrix(rnorm(m*n),ncol=m)%*%RSigma

betabar = rep(0,k*m)
Bbar = matrix(betabar, ncol=m)
A = diag(rep(0.01,k))
nu = 3
V = nu*diag(m)

betadraw = matrix(double(R*k*m), ncol=k*m)
Sigmadraw = matrix(double(R*m*m), ncol=m*m)

for (rep in 1:R) {
  out = rmultireg(Y, X, Bbar, A, nu, V)
  betadraw[rep,] = out$B
  Sigmadraw[rep,] = out$Sigma
  }

cat(" Betadraws ", fill=TRUE)
mat = apply(betadraw, 2, quantile, probs=c(0.01, 0.05, 0.5, 0.95, 0.99))
mat = rbind(as.vector(B),mat)
rownames(mat)[1] = "beta"
print(mat)

cat(" Sigma draws", fill=TRUE)
mat = apply(Sigmadraw, 2 ,quantile, probs=c(0.01, 0.05, 0.5, 0.95, 0.99))
mat = rbind(as.vector(Sigma),mat); rownames(mat)[1]="Sigma"
print(mat)



