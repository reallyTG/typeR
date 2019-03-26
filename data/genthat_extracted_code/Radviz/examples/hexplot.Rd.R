library(Radviz)


### Name: hexplot
### Title: A smoothScatter function for Radviz objects
### Aliases: hexplot

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)
rv <- do.hex(rv,channels='Sepal.Length',ncols=4,use.quantile=TRUE)
hexplot(rv,color='Sepal.Length')




