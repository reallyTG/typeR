library(missForest)


### Name: prodNA
### Title: Introduce Missing Values Completely at Random
### Aliases: prodNA
### Keywords: classes NA

### ** Examples

data(iris)
## Introduce 5% of missing values to the iris data set
iris.mis <- prodNA(iris, 0.05)
summary(iris.mis)



