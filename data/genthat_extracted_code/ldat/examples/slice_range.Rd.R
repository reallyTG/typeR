library(ldat)


### Name: slice_range
### Title: Select a range of records from an object
### Aliases: slice_range slice_range.lvec slice_range.ldat
###   slice_range.default slice_range.data.frame

### ** Examples

x <- as_lvec(1:20)
# Select elements 5:7
slice_range(x, range = c(5, 7))
slice_range(x, begin = 5, end = 7)
slice_range(x, range = c(5, 10), end = 7)
# also works for R-vectors
slice_range(1:20, range = c(5,7))
# convert lvec to rvec
slice_range(x, range = c(5,7), as_r = TRUE)




