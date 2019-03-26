library(swCRTdesign)


### Name: blkDiag
### Title: Block Diagonal Matrix Generator
### Aliases: blkDiag
### Keywords: block diagonal matrix

### ** Examples

library(swCRTdesign)
# Example 1 (input: array)
blkDiag.Ex1.array <- blkDiag( z=array(1:12, c(2,2,3)) )
blkDiag.Ex1.array

# Example 2 (input: list)
blkDiag.Ex2.list <- blkDiag( z=list(matrix(1,2,2), diag(2,3), matrix(3,4,4)) )
blkDiag.Ex2.list




