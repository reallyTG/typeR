library(gcdnet)


### Name: cv.gcdnet
### Title: Cross-validation for gcdnet
### Aliases: cv.gcdnet cv.hsvmpath cv.sqsvmpath cv.logitpath cv.lspath
###   cv.erpath
### Keywords: models regression

### ** Examples

# fit an elastic net penalized HHSVM 
# with lambda2 = 0.1 for the L2 penalty. Use the 
# misclassification rate as the cross validation 
# prediction loss. Use five-fold CV to choose 
# the optimal lambda for the L1 penalty.

data(FHT)
set.seed(2011)
cv=cv.gcdnet(FHT$x, FHT$y, method ="hhsvm",
lambda2=0.1, pred.loss="misclass", nfolds=5, delta=1.5)
plot(cv)

# fit an elastic net penalized least squares 
# with lambda2 = 0.1 for the L2 penalty. Use the 
# least square loss as the cross validation 
# prediction loss. Use five-fold CV to choose 
# the optimal lambda for the L1 penalty.

set.seed(2011)
cv1=cv.gcdnet(FHT$x, FHT$y_reg, method ="ls",
lambda2=0.1,pred.loss="loss", nfolds=5)
plot(cv1)

# To fit a LASSO penalized logistic regression
# we set lambda2 = 0 to disable the L2 penalty. Use the 
# logistic loss as the cross validation 
# prediction loss. Use five-fold CV to choose 
# the optimal lambda for the L1 penalty.

set.seed(2011)
cv2=cv.gcdnet(FHT$x, FHT$y, method ="logit",
lambda2 = 0, pred.loss="loss", nfolds=5)
plot(cv2)



