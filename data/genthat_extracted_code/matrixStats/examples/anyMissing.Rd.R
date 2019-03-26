library(matrixStats)


### Name: anyMissing
### Title: Checks if there are any missing values in an object or not
### Aliases: anyMissing colAnyMissings rowAnyMissings colAnyNAs rowAnyNAs
### Keywords: iteration logic

### ** Examples

 x <- rnorm(n = 1000)
 x[seq(300, length(x), by = 100)] <- NA
 stopifnot(anyMissing(x) == any(is.na(x)))




