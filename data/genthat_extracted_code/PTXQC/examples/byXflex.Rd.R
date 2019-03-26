library(PTXQC)


### Name: byXflex
### Title: Same as 'byX', but with more flexible group size, to avoid that
###   the last group has only a few entries (<50% of desired size).
### Aliases: byXflex

### ** Examples

 stopifnot(
   byXflex(data.frame(d=1:10), 1:10, 2, sum, sort_indices = FALSE) ==
   c(3, 7, 11, 15, 19)
 )
 



