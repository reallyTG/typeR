library(yaImpute)


### Name: plot.yai
### Title: Plot observed verses imputed data
### Aliases: plot.yai plot.impute.yai
### Keywords: hplot

### ** Examples

require(yaImpute)

data(iris)

# form some test data
refs=sample(rownames(iris),50)
x <- iris[,1:3]      # Sepal.Length Sepal.Width Petal.Length
y <- iris[refs,4:5]  # Petal.Width Species

mal <- yai(x=x,y=y,method="mahalanobis")
malImp=impute(mal,newdata=iris)
plot(malImp)




