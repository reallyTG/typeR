library(splus2R)


### Name: colIds
### Title: Column and row summary function
### Aliases: colIds colMaxs colMedians colMins colRanges colVars rowIds
###   rowMaxs rowMins rowRanges
### Keywords: utilities

### ** Examples

## create a matrix, add dimensions, and obtain
## various summaries
x <- matrix(sin(1:20), nrow=4)
dimnames(x) <- list(c("a","b","c","d"), paste("col", 1:5))
colIds(x)
colMaxs(x)
colMedians(x)
colMins(x)
colRanges(x)
rowIds(x)
rowMaxs(x)
rowMins(x)
rowRanges(x)



