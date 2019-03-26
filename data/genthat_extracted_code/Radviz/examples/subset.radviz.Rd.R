library(Radviz)


### Name: subset.radviz
### Title: Title
### Aliases: subset.radviz

### ** Examples

# create a radviz object
data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
rv <- do.radviz(iris,S)

# subset rv
srv <- subset(rv,iris$Species=='setosa')
summary(srv)
sum(iris$Species=='setosa') # 50 objects in srv corresponding to setosa values




