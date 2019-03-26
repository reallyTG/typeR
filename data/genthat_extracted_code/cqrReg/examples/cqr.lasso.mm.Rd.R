library(cqrReg)


### Name: cqr.lasso.mm
### Title: Composite Quantile Regression (cqr) with Adaptive Lasso Penalty
###   (lasso) use Majorize and Minimize (mm) Algorithm
### Aliases: cqr.lasso.mm
### Keywords: MM

### ** Examples

set.seed(1)
n=100
p=2
a=2*rnorm(n*2*p, mean = 1, sd =1)
x=matrix(a,n,2*p)
beta=2*rnorm(p,1,1)
beta=rbind(matrix(beta,p,1),matrix(0,p,1))
y=x%*%beta-matrix(rnorm(n,0.1,1),n,1)
tau=1:5/6
# x is 1000*20 matrix, y is 1000*1 vector, beta is 20*1 vector with last ten zero value elements. 
cqr.lasso.mm(x,y,tau)



