library(R.huge)


### Name: FileVector
### Title: Class representing a persistent vector stored on file
### Aliases: FileVector FileByteVector FileShortVector FileIntegerVector
###   FileFloatVector FileDoubleVector
### Keywords: classes

### ** Examples

library("R.utils")
verbose <- Arguments$getVerbose(TRUE)

pathname <- "example.Rvector"
if (isFile(pathname)) {
  file.remove(pathname)
  if (isFile(pathname)) {
    stop("File not deleted: ", pathname)
  }
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create a new file vector
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
verbose && enter(verbose, "Creating new vector")
# The length of the vector
length <- 1e6
X <- FileDoubleVector(pathname, length=length)
verbose && exit(verbose)
print(X)

verbose && enter(verbose, "Filling it with data")
idxs <- c(1:4,7:10)
x <- 1:length(idxs)
writeValues(X, indices=idxs, values=x)
verbose && exit(verbose)

verbose && enter(verbose, "Getting data again")
y <- readValues(X, indices=idxs)
verbose && exit(verbose)
stopifnot(all.equal(x,y))

verbose && enter(verbose, "Getting and setting data using [i,j]")
print(X[1:20])
i <- 13:15
X[i] <- 99:98
print(X[1:20])
verbose && exit(verbose)

delete(X)

rm(X)



