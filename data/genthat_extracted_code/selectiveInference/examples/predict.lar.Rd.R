library(selectiveInference)


### Name: predict.lar
### Title: Prediction and coefficient functions for least angle regression
### Aliases: predict.lar coef.lar

### ** Examples

set.seed(33)
n = 200
p = 20
sigma = 1
x = matrix(rnorm(n*p),n,p)
beta = c(rep(3,10),rep(0,p-10))
y = x%*%beta + sigma*rnorm(n)

# run lar and predict functions
obj = lar(x,y)
fit = predict(obj,x,s=3)



