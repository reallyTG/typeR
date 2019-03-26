library(cqrReg)


### Name: cqr.mm
### Title: Composite Quantile Regression (cqr) use Majorize and Minimize
###   (mm) Algorithm
### Aliases: cqr.mm
### Keywords: MM

### ** Examples

set.seed(1)
n=100
p=2
a=rnorm(n*p, mean = 1, sd =1)
x=matrix(a,n,p)
beta=rnorm(p,1,1)
beta=matrix(beta,p,1)
y=x%*%beta-matrix(rnorm(n,0.1,1),n,1)
tau=1:5/6
# x is 1000*10 matrix, y is 1000*1 vector, beta is 10*1 vector
cqr.mm(x,y,tau)



