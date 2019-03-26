library(goft)


### Name: mvshapiro_test
### Title: Shapiro-Wilk test for multivariate normality
### Aliases: mvshapiro_test
### Keywords: htest multivariate analysis

### ** Examples

# Example 1:  Testing multivariate normality on iris.virginica

# iris.virginica contains a set of measurements corresponding to 
# Iris virginica of famous  iris data set.

iris.virginica <- as.matrix(iris[iris$Species == "virginica", 1:4], ncol = 4) 
mvshapiro_test(iris.virginica)    


# Example 2:  Testing multivariate normality on the goats dataset
data(goats)
mvshapiro_test(as.matrix(goats))



