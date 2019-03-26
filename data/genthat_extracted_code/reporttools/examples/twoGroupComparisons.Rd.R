library(reporttools)


### Name: twoGroupComparisons
### Title: Compute a table with analysis of two groups comparisons
### Aliases: twoGroupComparisons
### Keywords: manip character

### ** Examples

set.seed(1977)
v0 <- round(runif(200, 0, 1))
v1 <- rnorm(200)
v2 <- rgamma(200, 2, 1)
twoGroupComparisons(vars = data.frame(v1, v2), v0) 



