library(dad)


### Name: as.data.frame.folder
### Title: Folder to data frame
### Aliases: as.data.frame.folder folder2df

### ** Examples

data(iris)

iris.fold <- as.folder(iris, "Species")
print(iris.fold)

iris.df <- as.data.frame(iris.fold)
print(iris.df)



