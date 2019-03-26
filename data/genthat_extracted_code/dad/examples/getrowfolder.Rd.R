library(dad)


### Name: getrow.folder
### Title: Select rows in all elements of a folder
### Aliases: getrow.folder

### ** Examples

data(iris)

iris.fold <- as.folder(iris, "Species")
getrow.folder(iris.fold, c(1:5, 51:55, 101:105))



