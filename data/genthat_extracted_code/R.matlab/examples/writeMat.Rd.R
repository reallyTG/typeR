library(R.matlab)


### Name: writeMat
### Title: Writes a MAT file structure
### Aliases: writeMat.default writeMat
### Keywords: file IO

### ** Examples
A <- matrix(1:27, ncol = 3)
B <- as.matrix(1:10)
C <- array(1:18, dim = c(2, 3, 3))

filename <- paste(tempfile(), ".mat", sep = "")

writeMat(filename, A = A, B = B, C = C)
data <- readMat(filename)
str(data)

X <- list(A = A, B = B, C = C)
stopifnot(all.equal(X, data[names(X)]))

unlink(filename)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# All objects written must be named uniquely
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
tryCatch({
  # Named
  writeMat(filename, A = A)
  # Not named
  writeMat(filename, A)
}, error = function(ex) {
  cat("ERROR:", ex$message, "\n")
})


tryCatch({
  # Uniquely named
  writeMat(filename, A = A, B = B, C = C)
  # Not uniquely named
  writeMat(filename, A = A, B = B, A = C)
}, error = function(ex) {
  cat("ERROR:", ex$message, "\n")
})


## Not run: 
##D # When writing to a stream connection the receiver needs to know on
##D # beforehand how many bytes are available. This can be done by using
##D # the 'onWrite' argument.
##D onWrite <- function(x)
##D   writeBin(x$length, con = x$con, size = 4, endian = "little")
##D   writeMat(con, A = A, B = B, onWrite = onWrite)
## End(Not run)



