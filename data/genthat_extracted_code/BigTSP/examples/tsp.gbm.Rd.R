library(BigTSP)


### Name: tsp.gbm
### Title: Fits generalized boosted logistic regression models based on Top
###   Scoring Pairs.
### Aliases: tsp.gbm
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(gbm)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
fit=tsp.gbm(x,y)
predict(fit,x[1:10,],n.trees=5)



