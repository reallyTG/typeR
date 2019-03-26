library(MALDIquant)


### Name: match.closest
### Title: Relaxed Value Matching
### Aliases: match.closest

### ** Examples

library("MALDIquant")
match.closest(c(1.1, 1.4, 9.8), 1:10)
# [1]  1  1 10
match.closest(c(1.1, 1.4, 9.8), 1:10, tolerance=0.25)
# [1]  1 NA 10
match.closest(c(1.1, 1.4, 9.8), 1:10, tolerance=0.25, nomatch=0)
# [1]  1  0 10

## this function is most useful if you want to subset an intensityMatrix
## by a few (reference) peaks

## create an example intensityMatrix
im <- matrix(1:10, nrow=2, dimnames=list(NULL, 1:5))
attr(im, "mass") <- 1:5
im
#      1 2 3 4  5
# [1,] 1 3 5 7  9
# [2,] 2 4 6 8 10
# attr(,"mass")
# [1] 1 2 3 4 5

## reference peaks
ref <- c(2.2, 4.8)

im[, match.closest(ref, attr(im, "mass"), tolerance=0.25, nomatch=0)]
#      2  5
# [1,] 3  9
# [2,] 4 10




