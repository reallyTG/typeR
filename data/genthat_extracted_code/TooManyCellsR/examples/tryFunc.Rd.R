library(TooManyCellsR)


### Name: tryFunc
### Title: Different error for importing data.
### Aliases: tryFunc

### ** Examples

input <- system.file("extdata", "mat.csv", package="TooManyCellsR")
fail = tryFunc(read.csv, "fail.csv")
fail
success = tryFunc(read.csv, input)
success



