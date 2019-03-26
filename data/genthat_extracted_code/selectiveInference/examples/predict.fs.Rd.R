library(selectiveInference)


### Name: predict.fs
### Title: Prediction and coefficient functions for forward stepwise
###   regression
### Aliases: predict.fs coef.fs

### ** Examples

set.seed(33)
n = 200
p = 20
sigma = 1
x = matrix(rnorm(n*p),n,p)
beta = c(rep(3,10),rep(0,p-10))
y = x%*%beta + sigma*rnorm(n)

# run forward stepwise and predict functions
obj = fs(x,y)
fit = predict(obj,x,s=3)



