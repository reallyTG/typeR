library(cqrReg)


### Name: cqr.ip
### Title: Composite Quantile Regression (cqr) use Interior Point (ip)
###   Method
### Aliases: cqr.ip
### Keywords: IP

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
#you should install quantreg first to run following command
#cqr.ip(x,y,tau)



