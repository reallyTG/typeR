library(ctmcd)


### Name: tm_abs
### Title: Single Year Corporate Credit Rating Transititions
### Aliases: tm_abs
### Keywords: datasets

### ** Examples

data(tm_abs)

## Matrix of relative transition frequencies
tm_rel=rbind((tm_abs/rowSums(tm_abs))[1:7,],c(rep(0,7),1))
tm_rel




