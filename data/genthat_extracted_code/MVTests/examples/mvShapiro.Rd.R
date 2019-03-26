library(MVTests)


### Name: mvShapiro
### Title: Multivariate Shapiro-Wilk Test for Multivariate Normality
### Aliases: mvShapiro

### ** Examples


data(iris) 
# For raw data
result <- mvShapiro(data=iris[,1:4])
summary(result)
#For grouped data
result.group <- mvShapiro(data=iris[,1:4],group=TRUE,G=iris[,5])
summary(result.group)



