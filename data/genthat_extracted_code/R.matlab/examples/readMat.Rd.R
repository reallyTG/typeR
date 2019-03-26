library(R.matlab)


### Name: readMat
### Title: Reads a MAT file structure from a connection or a file
### Aliases: readMat.default readMat
### Keywords: file IO

### ** Examples

path <- system.file("mat-files", package = "R.matlab")
pathname <- file.path(path, "ABC.mat")
data <- readMat(pathname)
print(data)



