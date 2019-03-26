library(dpglasso)


### Name: box_qp_f
### Title: box constrained Quadratic Program (QP)
### Aliases: box_qp_f
### Keywords: box constrained QP coordinate descent

### ** Examples

set.seed(2008)

# create problem data

m<-20;
aa<-array(rnorm(m^2),dim=c(m,m));
Q<-aa
Q<- Q + diag(rep(0.1,m));

b<-rnorm(m);

soln<-box_qp_f(Q, u=rep(0,m), b, rho=.2 , Maxiter=1000, tol = 10^-4)





