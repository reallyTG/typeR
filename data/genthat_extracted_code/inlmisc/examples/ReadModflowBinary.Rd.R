library(inlmisc)


### Name: ReadModflowBinary
### Title: Read MODFLOW Binary File
### Aliases: ReadModflowBinary
### Keywords: IO

### ** Examples

path <- system.file("extdata", "ex.hds", package = "inlmisc")
heads <- ReadModflowBinary(path, "array")
image(heads[[1]]$d)
str(heads[[1]])

path <- system.file("extdata", "ex.bud", package = "inlmisc")
budget <- ReadModflowBinary(path, "flow")
image(budget[[1]]$d)
str(budget[[1]])
str(budget[[11]])




