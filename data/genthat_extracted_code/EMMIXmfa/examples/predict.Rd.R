library(EMMIXmfa)


### Name: predict.emmix
### Title: Extend Clustering to New Observations
### Aliases: predict.emmix predict.mfa predict.mcfa predict.mtfa
###   predict.mctfa
### Keywords: cluster methods

### ** Examples

## No test: 
set.seed(42)
test <- sample(1 : nrow(iris), 100)
model <- mfa(iris[test, -5], g=3, q=3, itmax=500, nkmeans=3, nrandom=5)
pred_clust <- predict(model, iris[-test, -5])
minmis(pred_clust, iris[-test, 5])
## End(No test)



