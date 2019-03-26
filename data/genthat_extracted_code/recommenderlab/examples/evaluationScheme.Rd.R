library(recommenderlab)


### Name: evaluationScheme
### Title: Creator Function for evaluationScheme
### Aliases: evaluationScheme evaluationScheme,ratingMatrix-method

### ** Examples

data("MSWeb")

MSWeb10 <- sample(MSWeb[rowCounts(MSWeb) >10,], 50)
MSWeb10 

## simple split with 3 items given
esSplit <- evaluationScheme(MSWeb10, method="split",
        train = 0.9, k=1, given=3)
esSplit

## 4-fold cross-validation with all-but-1 items for learning.
esCross <- evaluationScheme(MSWeb10, method="cross-validation",
        k=4, given=-1)
esCross



