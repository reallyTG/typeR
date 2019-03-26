library(liquidSVM)


### Name: predict.liquidSVM
### Title: Predicts labels of new data using the selected SVM.
### Aliases: predict.liquidSVM predict

### ** Examples

## Multiclass classification
modelIris <- svm(Species ~ ., iris)
y <- predict(modelIris, iris)

## Least Squares
modelTrees <- svm(Height ~ Girth + Volume, trees)
y <- predict(modelTrees, trees)
plot(trees$Height, y)



