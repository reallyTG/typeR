library(R.filesets)


### Name: GenericDataFileSetList
### Title: The GenericDataFileSetList class
### Aliases: GenericDataFileSetList
### Keywords: classes

### ** Examples

# Setup a file set
path1 <- system.file(package="R.filesets")
ds1 <- GenericDataFileSet$byPath(path1)

path2 <- system.file(package="R.utils")
ds2 <- GenericDataFileSet$byPath(path2)

dsl <- GenericDataFileSetList(list(ds1, ds2), tags=c("*", "CustomTag"))
print(dsl)

df <- as.data.frame(dsl)
print(df)

print(df["DESCRIPTION","R.filesets"])




