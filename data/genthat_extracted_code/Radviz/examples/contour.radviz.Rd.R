library(Radviz)


### Name: contour.radviz
### Title: Creates a contour plot, or add a contour plot to an existing
###   plot for a Radviz Object
### Aliases: contour.radviz
### Keywords: hplot multivariate

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
rv <- do.density(rv)
contour(rv,point.shape=1,point.color=c('red','green','blue')[as.integer(iris$Species)])




