library(liquidSVM)


### Name: test.liquidSVM
### Title: Tests new data using the selected SVM.
### Aliases: test.liquidSVM test

### ** Examples

modelTrees <- svm(Height ~ Girth + Volume, trees[1:10, ])  # least squares
result <- test(modelTrees, trees[11:31, ], trees$Height[11:31])
errors(result)



