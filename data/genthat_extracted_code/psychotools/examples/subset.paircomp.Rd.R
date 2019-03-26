library(psychotools)


### Name: subset.paircomp
### Title: Subsetting/Reordering Paired Comparison Data
### Aliases: subset.paircomp reorder.paircomp
### Keywords: classes

### ** Examples

pc <- paircomp(rbind(
  c(1,  1,  1), # a > b, a > c, b > c
  c(1,  1, -1), # a > b, a > c, b < c
  c(1, -1, -1), # a > b, a < c, b < c
  c(1,  1,  1)))
reorder(pc, c("c", "a"))



