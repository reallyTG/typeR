library(mda)


### Name: fda
### Title: Flexible Discriminant Analysis
### Aliases: fda print.fda
### Keywords: classif

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
irisfit
## fda(formula = Species ~ ., data = iris)
##
## Dimension: 2 
##
## Percent Between-Group Variance Explained:
##     v1     v2 
##  99.12 100.00 
##
## Degrees of Freedom (per dimension): 5 
##
## Training Misclassification Error: 0.02 ( N = 150 )

confusion(irisfit, iris)
##            Setosa Versicolor Virginica 
##     Setosa     50          0         0
## Versicolor      0         48         1
##  Virginica      0          2        49
## attr(, "error"):
## [1] 0.02

plot(irisfit)

coef(irisfit)
##           [,1]        [,2]
## [1,] -2.126479 -6.72910343
## [2,] -0.837798  0.02434685
## [3,] -1.550052  2.18649663
## [4,]  2.223560 -0.94138258
## [5,]  2.838994  2.86801283

marsfit <- fda(Species ~ ., data = iris, method = mars)
marsfit2 <- update(marsfit, degree = 2)
marsfit3 <- update(marsfit, theta = marsfit$means[, 1:2]) 
## this refits the model, using the fitted means (scaled theta's)
## from marsfit to start the iterations



