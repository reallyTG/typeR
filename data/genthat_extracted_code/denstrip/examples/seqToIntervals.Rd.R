library(denstrip)


### Name: seqToIntervals
### Title: Find contiguous sequences in a vector of integers
### Aliases: seqToIntervals
### Keywords: manip arith

### ** Examples

seqToIntervals(1:10)  # [1 10]
seqToIntervals(c(1:10, 15:18, 20))  # [1 10; 15 18; 20 20]
# vectorised, so efficient for large vectors x
seqToIntervals(sample(1:1000000, size=999990)) 



