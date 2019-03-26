library(AdjBQR)


### Name: BQR
### Title: Adjusted Bayesian Quantile Regression
### Aliases: BQR

### ** Examples

#A simulation example
library(AdjBQR)
n=200
set.seed(12368819)
x1 = rnorm(n)
x2 = rnorm(n)
y=2*x1+2*x2+rt(n,df=3)
x = cbind(1, x1, x2)
## Bayesian quantile regression based on asymmetric Laplace likelihood
BQR(y, x, tau=0.5, level=0.9)



