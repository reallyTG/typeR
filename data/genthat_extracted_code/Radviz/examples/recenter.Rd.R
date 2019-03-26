library(Radviz)


### Name: recenter
### Title: Rotate Dimensional Anchors around the Unit Circle
### Aliases: recenter

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
iris.S <- make.S(das)
iris.S
recenter(iris.S,'Petal.Length')




