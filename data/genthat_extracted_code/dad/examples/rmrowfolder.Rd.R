library(dad)


### Name: rmrow.folder
### Title: Remove rows in all elements of a folder
### Aliases: rmrow.folder

### ** Examples

data(iris)

iris.fold <- as.folder(iris, "Species")
rmrow.folder(iris.fold, as.character(seq(1, 150, by = 2)))



