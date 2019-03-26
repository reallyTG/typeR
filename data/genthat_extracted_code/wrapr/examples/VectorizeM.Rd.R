library(wrapr)


### Name: VectorizeM
### Title: Memoizing wrapper to base::Vectorize()
### Aliases: VectorizeM

### ** Examples


fs <- function(x) { x <- x[[1]]; print(paste("see", x)); sin(x) }
fv <- VectorizeM(fs)
# should only print "see" twice, not 6 times
fv(c(0, 1, 1, 0, 0, 1))




