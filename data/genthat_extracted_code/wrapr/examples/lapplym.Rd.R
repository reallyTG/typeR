library(wrapr)


### Name: lapplym
### Title: Memoizing wrapper for lapply.
### Aliases: lapplym

### ** Examples


fs <- function(x) { x <- x[[1]]; print(paste("see", x)); sin(x) }
# should only print "see" twice, not 6 times
lapplym(c(0, 1, 1, 0, 0, 1), fs)




