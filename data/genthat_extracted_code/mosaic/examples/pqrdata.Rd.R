library(mosaic)


### Name: qdata
### Title: The Data Distribution
### Aliases: qdata cdata pdata rdata ddata
### Keywords: distribution

### ** Examples

data(iris)
qdata(Sepal.Length ~ Species, 0.5, data=iris)
qdata(~Sepal.Length, p = 0.5, groups=Species, data=iris)
qdata(iris$Sepal.Length, p = 0.5)
qdata(~ Sepal.Length, p = 0.5, data=iris)
qdata(~ Sepal.Length, p = 0.5, groups=Species, data=iris)
data(iris)
cdata(iris$Sepal.Length, 0.5)
cdata( ~ Sepal.Length, 0.5, data = iris)
cdata( ~ Sepal.Length, 0.5, data = iris)
cdata( ~ Sepal.Length | Species, data = iris, p = .5)
data(iris)
pdata(iris$Sepal.Length, 3:6)
pdata( ~ Sepal.Length, 3:6, data=iris)
data(iris)
rdata(iris$Species, 10)
rdata(~Species, n = 10, data=iris)
rdata(Sepal.Length ~ Species,  n = 5, data=iris)
data(iris)
ddata(iris$Species, 'setosa')
ddata(~Species, 'setosa', data=iris)



