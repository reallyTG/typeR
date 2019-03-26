library(BigTSP)


### Name: LDCA
### Title: Linear Discriminant Analysis based on Top Scoring Pair
### Aliases: LDCA
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(glmnet)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
fit=LDCA(x,y)
print(fit)
predict(fit,newx=x[1:10,]) # make predictions



