library(Boom)


### Name: mscan
### Title: Scan a Matrix
### Aliases: mscan

### ** Examples

cat("foo bar baz", "1 2 3", "4 5 6", file = "example.data", sep = "\n")
m <- mscan("example.data", header = TRUE)
m
##      foo bar baz
## [1,]   1   2   3
## [2,]   4   5   6



