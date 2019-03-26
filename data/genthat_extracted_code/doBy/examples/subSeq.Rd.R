library(doBy)


### Name: subSeq
### Title: Find sub-sequences of identical elements in a vector.
### Aliases: subSeq
### Keywords: utilities

### ** Examples


x <- c(1, 1, 1, 0, 0, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 3)
(ans <- subSeq(x))
ans$value
# Notice: Same results below
subSeq(x, item=1)
subSeq(x, item="1")

x <- as.character(c(1, 1, 1, 0, 0, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 3))
(ans<-subSeq(x))
ans$value
# Notice: Same results below
subSeq(x, item="1")
subSeq(x, item=1)




