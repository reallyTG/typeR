library(hdm)


### Name: rlassoEffects
### Title: rigorous Lasso for Linear Models: Inference
### Aliases: rlassoEffect rlassoEffects rlassoEffects.default
###   rlassoEffects.formula

### ** Examples

library(hdm); library(ggplot2)
set.seed(1)
n = 100 #sample size
p = 100 # number of variables
s = 3 # nubmer of non-zero variables
X = matrix(rnorm(n*p), ncol=p)
colnames(X) <- paste("X", 1:p, sep="")
beta = c(rep(3,s), rep(0,p-s))
y = 1 + X%*%beta + rnorm(n)
data = data.frame(cbind(y,X))
colnames(data)[1] <- "y"
fm = paste("y ~", paste(colnames(X), collapse="+"))
fm = as.formula(fm)                 
lasso.effect = rlassoEffects(X, y, index=c(1,2,3,50))
lasso.effect = rlassoEffects(fm, I = ~ X1 + X2 + X3 + X50, data=data)
print(lasso.effect)
summary(lasso.effect)
confint(lasso.effect)
plot(lasso.effect)



