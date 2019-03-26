library(mvShapiroTest)


### Name: mvShapiro.Test
### Title: Generalized Shapiro-Wilk test for multivariate normality
### Aliases: mvShapiro.Test
### Keywords: htest multivariate

### ** Examples

X <-  matrix(rnorm(40),ncol=2)    # Generating a two dimensional random sample of size 20
mvShapiro.Test(X)                 # Testing multivariate normality on X

#-----------------------------------------------------------------------------------
# iris.virginica contains a set of measurements corresponding to 
# Iris virginica of the famous  iris dataset.

iris.virginica <- as.matrix(iris[iris$Species == "virginica",1:4],ncol=4) 
mvShapiro.Test(iris.virginica)    # Testing multivariate normality on iris.virginica



