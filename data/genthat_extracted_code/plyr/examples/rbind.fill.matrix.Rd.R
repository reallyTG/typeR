library(plyr)


### Name: rbind.fill.matrix
### Title: Bind matrices by row, and fill missing columns with NA.
### Aliases: rbind.fill.matrix
### Keywords: manip

### ** Examples

A <- matrix (1:4, 2)
B <- matrix (6:11, 2)
A
B
rbind.fill.matrix (A, B)

colnames (A) <- c (3, 1)
A
rbind.fill.matrix (A, B)

rbind.fill.matrix (A, 99)



