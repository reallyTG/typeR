library(gcdnet)


### Name: plot.cv.gcdnet
### Title: plot the cross-validation curve produced by cv.gcdnet
### Aliases: plot.cv.gcdnet
### Keywords: models regression

### ** Examples

# fit an elastic net penalized logistic regression 
# with lambda2 = 1 for the L2 penalty. Use the 
# logistic loss as the cross validation 
# prediction loss. Use five-fold CV to choose 
# the optimal lambda for the L1 penalty.
data(FHT)
set.seed(2011)
cv=cv.gcdnet(FHT$x, FHT$y, method ="logit",
lambda2 = 1, pred.loss="loss", nfolds=5)
plot(cv)



