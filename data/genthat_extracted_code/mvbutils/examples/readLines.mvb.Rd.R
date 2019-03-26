library(mvbutils)


### Name: readLines.mvb
### Title: Read text lines from a connection
### Aliases: readLines.mvb
### Keywords: IO

### ** Examples

tt <- tempfile()
cat( letters[ 1:6], sep="\n", file=tt)
the.data <- readLines.mvb( tt, EOF="d")
unlink( tt)
the.data # [1] "a" "b" "c"



