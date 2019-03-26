library(psychotools)


### Name: labels<-
### Title: Set Labels
### Aliases: labels<-
### Keywords: classes

### ** Examples

## method for "paircomp" data
pc <- paircomp(rbind(
  c(1,  1,  1), # a > b, a > c, b > c
  c(1,  1, -1), # a > b, a > c, b < c
  c(1, -1, -1), # a > b, a < c, b < c
  c(1,  1,  1)))
labels(pc)
labels(pc) <- c("ah", "be", "ce")
pc



