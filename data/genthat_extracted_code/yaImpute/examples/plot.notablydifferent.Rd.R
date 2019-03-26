library(yaImpute)


### Name: plot.notablyDifferent
### Title: Plots the scaled root mean square differences between observed
###   and predicted
### Aliases: plot.notablyDifferent
### Keywords: hplot

### ** Examples

require(yaImpute)

data(iris)

set.seed(12345)

# form some test data
refs=sample(rownames(iris),50)
x <- iris[,1:3]      # Sepal.Length Sepal.Width Petal.Length
y <- iris[refs,4:5]  # Petal.Width Species

mal <- notablyDifferent(yai(x=x,y=y,method="mahalanobis"),vars=colnames(x))
if (require(randomForest))
{
  rf  <- notablyDifferent(yai(x=x,y=y,method="randomForest"),vars=colnames(x))
  plot.notablyDifferent(list(Mahalanobis=mal,randomForest=rf))
}




