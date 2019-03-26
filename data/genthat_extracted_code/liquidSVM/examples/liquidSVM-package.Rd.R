library(liquidSVM)


### Name: liquidSVM-package
### Title: liquidSVM for R
### Aliases: liquidSVM-package liquidSVM
### Keywords: SVM

### ** Examples

set.seed(123)
## Multiclass classification
modelIris <- svm(Species ~ ., iris)
y <- predict(modelIris, iris)

## Least Squares
modelTrees <- svm(Height ~ Girth + Volume, trees)
y <- predict(modelTrees, trees)
plot(trees$Height, y)
test(modelTrees, trees)

## Quantile regression
modelTrees <- qtSVM(Height ~ Girth + Volume, trees, scale=TRUE)
y <- predict(modelTrees, trees)

## ROC curve
modelWarpbreaks <- rocSVM(wool ~ ., warpbreaks, scale=TRUE)
y <- test(modelWarpbreaks, warpbreaks)
plotROC(y,warpbreaks$wool)



