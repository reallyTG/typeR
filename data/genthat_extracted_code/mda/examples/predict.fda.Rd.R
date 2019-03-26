library(mda)


### Name: predict.fda
### Title: Classify by Flexible Discriminant Analysis
### Aliases: predict.fda
### Keywords: classif

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
irisfit
## Call:
## fda(x = iris$x, g = iris$g)
## 
## Dimension: 2 
##
## Percent Between-Group Variance Explained:
##     v1  v2 
##  99.12 100
confusion(predict(irisfit, iris), iris$Species)
##            Setosa Versicolor Virginica
##     Setosa     50          0         0
## Versicolor      0         48         1
##  Virginica      0          2        49
## attr(, "error"):
## [1] 0.02



