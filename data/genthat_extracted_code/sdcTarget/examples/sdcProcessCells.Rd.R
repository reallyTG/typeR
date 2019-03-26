library(sdcTarget)


### Name: sdcProcessCells
### Title: Identify or Remove Small or Large Cells From a Hash List
### Aliases: identifyBigCellRecords identifyBigCells
###   identifySmallCellRecords identifySmallCells removeBigCellRecords
###   removeSmallCellRecords sdcProcessCells
### Keywords: big cells, identify, remove small

### ** Examples

my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
identifySmallCells(my.hc)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
identifyBigCells(my.hc)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
identifySmallCellRecords(my.hc)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
identifyBigCellRecords(my.hc)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
removeSmallCellRecords(my.X, my.hc)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
removeBigCellRecords(my.X, my.hc)



