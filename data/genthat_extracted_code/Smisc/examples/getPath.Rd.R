library(Smisc)


### Name: getPath
### Title: Get the path of a vector of filenames
### Aliases: getPath
### Keywords: misc

### ** Examples

getPath(c(a="this.good.path/filename.R", b="nopath.R", c="/", d=NA,
          e="path1/path2/", ""))

# An example with 'real' files
files <- dir(file.path(path.package(package = "Smisc"), "data"), full.names = TRUE)
print(files)
getPath(files)



