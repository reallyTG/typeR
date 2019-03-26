library(Radviz)


### Name: Radviz
### Title: Radviz Projection of Multidimensional Data
### Aliases: Radviz Radviz-package

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
plot(rv,point.shape=1,point.color=c('red','green','blue')[as.integer(iris$Species)])




