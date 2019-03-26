library(gcdnet)


### Name: coef.cv.gcdnet
### Title: get coefficients or make coefficient predictions from a
###   "cv.gcdnet" object.
### Aliases: coef.cv.gcdnet
### Keywords: models regression

### ** Examples

data(FHT)
set.seed(2011)
cv=cv.gcdnet(FHT$x, FHT$y, 
	lambda2 = 1,nfolds=5)
coef(cv,s="lambda.min")



