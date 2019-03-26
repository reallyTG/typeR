library(Smisc)


### Name: stripPath
### Title: Remove the path from a vector of filenames
### Aliases: stripPath
### Keywords: misc

### ** Examples

stripPath(c(a = "this.good.path/filename.R", b = "nopath.R", c = "/", d = NA,
            e = "only.paths.1/only.paths.2/", ""))

# An example with 'real' files
files <- dir(file.path(path.package(package = "Smisc"), "data"), full.names = TRUE)
print(files)
stripPath(files)
stripPath(stripExtension(files))



