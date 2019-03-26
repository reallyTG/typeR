library(fence)


### Name: IF.lm
### Title: Invisible Fence model selection (Linear Model)
### Aliases: IF.lm

### ** Examples

library(fence)
library(MASS)
library(snow)
r =1234; set.seed(r)
p=10; n=300; rho = 0.6
R = diag(p)
for(i in 1:p){
  for(j in 1:p){
     R[i,j] = rho^(abs(i-j))
  }
}
R = 1*R
x=mvrnorm(n, rep(0, p), R)
colnames(x)=paste('x',1:p, sep='')
X = cbind(rep(1,n),x)
tbetas = c(1,1,1,0,1,1,0,1,0,0,0)  # non-zero beta 1,2,4,5,7
epsilon = rnorm(n)
y = as.matrix(X)%*%tbetas + epsilon
colnames(y) = 'y'
data = data.frame(cbind(X,y))
full = y ~ x1+x2+x3+x4+x5+x6+x7+x8+x9+x10
# Takes greater than 5 seconds (~`17 seconds) to run
# obj1 = IF.lm(full = full, data = data, B = 100, lftype = "abscoef")
# sort((names(obj1$model$coef)[-1]))  
# obj2 = IF.lm(full = full, data = data, B = 100, lftype = "pvalue")
# sort(setdiff(names(data[c(-1,-12)]), names(obj2$model$coef)))




