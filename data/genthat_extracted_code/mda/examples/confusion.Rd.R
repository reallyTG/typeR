library(mda)


### Name: confusion
### Title: Confusion Matrices
### Aliases: confusion confusion.default confusion.list confusion.fda
### Keywords: category

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
confusion(predict(irisfit, iris), iris$Species)
##            Setosa Versicolor Virginica 
##     Setosa     50          0         0
## Versicolor      0         48         1
##  Virginica      0          2        49
## attr(, "error"):
## [1] 0.02



