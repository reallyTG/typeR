library(cqrReg)


### Name: QR.admm
### Title: Quantile Regression (QR) use Alternating Direction Method of
###   Multipliers (ADMM) algorithm
### Aliases: QR.admm
### Keywords: ADMM

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
QR.admm(x,y,0.1)



