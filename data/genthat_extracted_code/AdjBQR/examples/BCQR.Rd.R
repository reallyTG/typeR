library(AdjBQR)


### Name: BCQR
### Title: Adjusted Bayesian Censored Quantile Regression
### Aliases: BCQR

### ** Examples

#A simulation example
library(AdjBQR)
n=200
set.seed(12368819)
x1=rnorm(n)
x2=rnorm(n)
ystar=3/4+2*x1+3*x2+rt(n,df=3)
y=ystar*(ystar>0)
delta=1*(ystar>0)
x = cbind(x1, x2)
## Bayesian censored quantile regression based on asymmetric-Laplace-type likelihood
BCQR(y, x, tau=0.5, level=0.9)



