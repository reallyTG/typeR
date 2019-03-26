library(cqrReg)


### Name: QR.cd
### Title: Quantile Regression (QR) use Coordinate Descent (cd) Algorithms
### Aliases: QR.cd
### Keywords: CD

### ** Examples

set.seed(1)
n=100
p=2
a=rnorm(n*p, mean = 1, sd =1)
x=matrix(a,n,p)
beta=rnorm(p,1,1)
beta=matrix(beta,p,1)
y=x%*%beta-matrix(rnorm(n,0.1,1),n,1)
# x is 1000*10 matrix, y is 1000*1 vector, beta is 10*1 vector
QR.cd(x,y,0.1)



