library(dad)


### Name: cor.folder
### Title: Correlation matrices of a folder of data sets
### Aliases: cor.folder corf

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
iris.cor <- cor.folder(iris.fold)
print(iris.cor)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "rose")
roses.cor <- cor.folder(roses.fold)
print(roses.cor)



