library(ctmcd)


### Name: gmDA
### Title: Diagonal Adjustment
### Aliases: gmDA

### ** Examples

## Derive matrix of relative transition frequencies
data(tm_abs)
tm_rel=rbind((tm_abs/rowSums(tm_abs))[1:7,],c(rep(0,7),1))

## Derive diagonal adjustment generator matrix estimate
gmda=gmDA(tm_rel,1)
gmda



