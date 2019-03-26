library(plyr)


### Name: revalue
### Title: Replace specified values with new values, in a factor or
###   character vector.
### Aliases: revalue

### ** Examples

x <- c("a", "b", "c")
revalue(x, c(a = "A", c = "C"))
revalue(x, c("a" = "A", "c" = "C"))

y <- factor(c("a", "b", "c", "a"))
revalue(y, c(a = "A", c = "C"))



