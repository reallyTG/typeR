library(dad)


### Name: getcol.folder
### Title: Select columns in all elements of a folder
### Aliases: getcol.folder

### ** Examples

data(iris)

iris.fold <- as.folder(iris, "Species")
getcol.folder(iris.fold, "Sepal.Length")
getcol.folder(iris.fold, c("Petal.Length", "Petal.Width"))



