library(ctmcd)


### Name: gmWA
### Title: Weighted Adjustment
### Aliases: gmWA

### ** Examples

## Derive matrix of relative transition frequencies
data(tm_abs)
tm_rel=rbind((tm_abs/rowSums(tm_abs))[1:7,],c(rep(0,7),1))

## Derive weighted adjustment generator matrix estimate
gmwa=gmWA(tm_rel,1)
gmwa



