library(Radviz)


### Name: is.radviz
### Title: Test if the object is a Radviz object
### Aliases: is.radviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)

is.radviz(rv) # should be true




