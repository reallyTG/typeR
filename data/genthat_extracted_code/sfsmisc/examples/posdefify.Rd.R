library(sfsmisc)


### Name: posdefify
### Title: Find a Close Positive Definite Matrix
### Aliases: posdefify
### Keywords: algebra array

### ** Examples

 set.seed(12)
 m <- matrix(round(rnorm(25),2), 5, 5); m <- 1+ m + t(m); diag(m) <- diag(m) + 4
 m
 posdefify(m)
 1000 * zapsmall(m - posdefify(m))



