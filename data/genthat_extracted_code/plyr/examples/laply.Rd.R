library(plyr)


### Name: laply
### Title: Split list, apply function, and return results in an array.
### Aliases: laply
### Keywords: manip

### ** Examples

laply(baseball, is.factor)
# cf
ldply(baseball, is.factor)
colwise(is.factor)(baseball)

laply(seq_len(10), identity)
laply(seq_len(10), rep, times = 4)
laply(seq_len(10), matrix, nrow = 2, ncol = 2)



