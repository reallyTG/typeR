library(dad)


### Name: rmcol.folder
### Title: Remove columns in all elements of a folder
### Aliases: rmcol.folder

### ** Examples

data(iris)

iris.fold <- as.folder(iris, "Species")
rmcol.folder(iris.fold, c("Petal.Length", "Petal.Width"))



