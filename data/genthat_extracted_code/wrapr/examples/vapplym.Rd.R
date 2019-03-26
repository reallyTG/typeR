library(wrapr)


### Name: vapplym
### Title: Memoizing wrapper for vapply.
### Aliases: vapplym

### ** Examples


fs <- function(x) { x <- x[[1]]; print(paste("see", x)); sin(x) }
# should only print "see" twice, not 6 times
vapplym(c(0, 1, 1, 0, 0, 1), fs, numeric(1))




