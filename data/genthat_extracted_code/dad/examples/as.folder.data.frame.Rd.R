library(dad)


### Name: as.folder.data.frame
### Title: Data frame to folder
### Aliases: as.folder.data.frame df2folder

### ** Examples

# First example: iris (Fisher)               
data(iris)
iris.fold <- as.folder(iris, "Species")
print(iris.fold)

# Second example: roses
data(roses)
roses.fold <- as.folder(roses, "Lot")
print(roses.fold)



