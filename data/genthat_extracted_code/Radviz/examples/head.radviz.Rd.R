library(Radviz)


### Name: head.radviz
### Title: Radviz Object Summary, head, Print, Subset Methods
### Aliases: head.radviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)

head(rv)




