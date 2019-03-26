library(Radviz)


### Name: smoothRadviz
### Title: A smoothScatter function for Radviz objects
### Aliases: smoothRadviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
smoothRadviz(rv)




