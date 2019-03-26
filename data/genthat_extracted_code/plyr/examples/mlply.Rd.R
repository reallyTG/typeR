library(plyr)


### Name: mlply
### Title: Call function with arguments in array or data frame, returning a
###   list.
### Aliases: mlply
### Keywords: manip

### ** Examples

mlply(cbind(1:4, 4:1), rep)
mlply(cbind(1:4, times = 4:1), rep)

mlply(cbind(1:4, 4:1), seq)
mlply(cbind(1:4, length = 4:1), seq)
mlply(cbind(1:4, by = 4:1), seq, to = 20)



