library(dpglasso)


### Name: dpglasso
### Title: dpglasso
### Aliases: dpglasso
### Keywords: graphical lasso sparse inverse covariance selection DPGLASSO
###   Primal Graphical Lasso

### ** Examples

set.seed(2008)

# create data

n=10; p = 5; 
X<-array(rnorm(n*p),dim=c(n,p)); # data-matrix 
Sigma=cov(X); # sample covariance matrix

q<-max(abs(Sigma[row(Sigma)> col(Sigma)])); 
rho=q*0.7;
B<-dpglasso(Sigma,rho=rho,outer.Maxiter=20,outer.tol=10^-6); 
# uses the default initializations for the covariance and precision matrices


# now solve the problem for a smaller value of rho,
# using the previous solution as warm-start
rho.new=rho*.8;
B.new<-dpglasso(Sigma,X=B$X,invX=B$invX,
rho=rho.new,outer.Maxiter=20,outer.tol=10^-6);




