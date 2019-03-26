library(filenamer)


### Name: filename
### Title: Utilities for managing file names.
### Aliases: filename filename-package

### ** Examples

# file name is date-time stamped and put in subdirectory by default
fn <- filename("data", tag="qc", ext="txt")
print(as.character(fn))

# disable date-time stamping and subdirectory insertion
fn2 <- filename("data", tag="qc", date=NA, time=NA, subdir=FALSE)
print(as.character(fn2))

# creating a new file name from an existing one yields a new time stamp
fn3 <- filename(fn)
print(as.character(fn3))



