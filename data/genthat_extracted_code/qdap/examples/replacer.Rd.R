library(qdap)


### Name: replacer
### Title: Replace Cells in a Matrix or Data Frame
### Aliases: replacer
### Keywords: replace

### ** Examples

## Not run: 
##D replacer(mtcars[1:10, ], 0, "REP")
##D replacer(mtcars[1:10, ], 4, NA)
##D replacer(c("a", "b"), "a", "foo")
##D #replace missing values (NA)
##D dat <- data.frame(matrix(sample(c(1:3, NA), 25, TRUE), ncol=5))
##D replacer(dat, NA, "FOO")
## End(Not run)



