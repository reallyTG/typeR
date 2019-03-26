library(glinternet)


### Name: glinternet.cv
### Title: Cross-validation for glinternet
### Aliases: glinternet.cv
### Keywords: models interactions group-lasso

### ** Examples

Y = rnorm(100)
numLevels = sample(1:5, 10, replace=TRUE)
X = sapply(numLevels, function(x) if (x==1)
rnorm(100) else sample(0:(x-1), 100, replace=TRUE))
fit = glinternet.cv(X, Y, numLevels, nFolds=3)



