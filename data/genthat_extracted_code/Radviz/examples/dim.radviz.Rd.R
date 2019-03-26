library(Radviz)


### Name: dim.radviz
### Title: Dimensions of a Radviz Object
### Aliases: dim.radviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)

dim(rv)
nrow(rv) # for free!




