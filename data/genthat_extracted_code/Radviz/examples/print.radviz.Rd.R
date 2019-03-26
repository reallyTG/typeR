library(Radviz)


### Name: print.radviz
### Title: Print Radviz Object
### Aliases: print.radviz

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)

print(rv)




