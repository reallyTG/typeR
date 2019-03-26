library(lambda.tools)


### Name: slice
### Title: Slice a sequence into two adjacent sub-sequences
### Aliases: slice

### ** Examples

# The number 4 is included in each sub-sequence
x <- 1:10
slice(x, 4, TRUE)

# With expressions, the sub-sequences are not necessarily contiguous
slice(x, x %% 2 == 0)

# Same as above but in two dimensions
x <- matrix(1:40, ncol=4)
slice(x, 4)




