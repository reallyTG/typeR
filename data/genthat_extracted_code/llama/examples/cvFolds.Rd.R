library(llama)


### Name: cvFolds
### Title: Cross-validation folds
### Aliases: cvFolds
### Keywords: models

### ** Examples

data(satsolvers)
folds = cvFolds(satsolvers)

# use 5 folds instead of the default 10
folds5 = cvFolds(satsolvers, 5L)

# stratify
foldsU = cvFolds(satsolvers, stratify=TRUE)



