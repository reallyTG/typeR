library(randomGLM)


### Name: thinRandomGLM
### Title: Random generalized linear model predictor thinning
### Aliases: thinRandomGLM
### Keywords: misc

### ** Examples


## binary outcome prediction
# data generation
data(iris)
# Restrict data to first 100 observations
iris=iris[1:100,]
# Turn Species into a factor
iris$Species = as.factor(as.character(iris$Species))
# Select a training and a test subset of the 100 observations
set.seed(1)
indx = sample(100, 67, replace=FALSE)
xyTrain = iris[indx,]
xyTest = iris[-indx,]
xTrain = xyTrain[, -5]
yTrain = xyTrain[, 5]

xTest = xyTest[, -5]
yTest = xyTest[, 5]

# predict with a small number of bags - normally nBags should be at least 100.
RGLM = randomGLM(xTrain, yTrain, nCandidateCovariates=ncol(xTrain), nBags=30, keepModels = TRUE, nThreads = 1)
table(RGLM$timesSelectedByForwardRegression[1, ])
# 0  7 23 
# 2  1  1 

thinnedRGLM = thinRandomGLM(RGLM, threshold=7)
predicted = predict(thinnedRGLM, newdata = xTest, type="class")
predicted = predict(RGLM, newdata = xTest, type="class")




