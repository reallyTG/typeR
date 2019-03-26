library(superml)


### Name: SVMTrainer
### Title: Support Vector Machines Trainer
### Aliases: SVMTrainer
### Keywords: datasets

### ** Examples

data(iris)
## Multiclassification
svm <- SVMTrainer$new(type="mc")
svm$fit(iris, "Species")
p <- svm$predict(iris)

## Least Squares
svm <- SVMTrainer$new(type="ls")
svm$fit(trees, "Height")
p <- svm$predict(trees)

## Quantile regression
svm <- SVMTrainer$new(type="qt")
svm$fit(trees,"Height")
p <- svm$predict(trees)



