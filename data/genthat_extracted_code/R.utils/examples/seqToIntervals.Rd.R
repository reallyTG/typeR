library(R.utils)


### Name: seqToIntervals
### Title: Gets all contiguous intervals of a vector of indices
### Aliases: seqToIntervals.default seqToIntervals
### Keywords: attribute

### ** Examples

x <- 1:10
y <- seqToIntervals(x)
print(y)  # [1 10]

x <- c(1:10, 15:18, 20)
y <- seqToIntervals(x)
print(y)  # [1 10; 15 18; 20 20]

z <- intervalsToSeq(y)
print(z)
stopifnot(all.equal(x,z))



