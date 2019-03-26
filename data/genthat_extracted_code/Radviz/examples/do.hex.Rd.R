library(Radviz)


### Name: do.hex
### Title: Computes 2D hexagonal bins from a Radviz projection
### Aliases: do.hex

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
rv <- do.hex(rv,channels='Sepal.Length',ncols=4,use.quantile=TRUE)
summary(rv$hex)




