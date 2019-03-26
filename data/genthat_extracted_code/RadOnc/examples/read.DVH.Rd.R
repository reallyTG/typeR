library(RadOnc)


### Name: read.DVH
### Title: Read DVH data from input file
### Aliases: read.DVH
### Keywords: file

### ** Examples

# Read two DVH example files
file1 <- system.file("extdata/John_Doe.dvh", package="RadOnc")
johndoe <- read.DVH(file=file1, type="aria10", verbose=TRUE)
file2 <- system.file("extdata/Jane_Doe.dvh", package="RadOnc")
janedoe <- read.DVH(file=file2, type="aria10", verbose=TRUE)
combined <- read.DVH(file=c(file1, file2), type="aria10", collapse=TRUE)



