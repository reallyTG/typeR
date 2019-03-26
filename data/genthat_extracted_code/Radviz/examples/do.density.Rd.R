library(Radviz)


### Name: do.density
### Title: Computes 2D density for contour plots of Radviz objects
### Aliases: do.density

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
rv <- do.density(rv)
contour(rv,point.shape=1,point.color=c('red','green','blue')[as.integer(iris$Species)])




