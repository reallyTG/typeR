library(filesstrings)


### Name: all_equal
### Title: A more flexible version of all.equal for vectors.
### Aliases: all_equal

### ** Examples

all_equal(1, rep(1, 3))
all_equal(2, 1:3)
all_equal(1:4, 1:4)
all_equal(1:4, c(1, 2, 3, 3))
all_equal(rep(1, 10))
all_equal(c(1, 88))
all_equal(1:2)
all_equal(list(1:2))
all_equal(1:4, matrix(1:4, nrow = 2))  # note that this gives TRUE



