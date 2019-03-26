library(rbugs)


### Name: genDataFile
### Title: Generating the Data File for BUGS
### Aliases: genDataFile
### Keywords: utilities

### ** Examples

dat <- list(a = runif(1), b=rnorm(2), c=matrix(rexp(4), 2, 2))
genDataFile(dat, "foo.txt")
file.show("foo.txt")
unlink("foo.txt")



