library(ctmcd)


### Name: gmQO
### Title: Quasi-Optimization
### Aliases: gmQO

### ** Examples

data(tm_abs)
## Derive matrix of relative transition frequencies
data(tm_abs)
tm_rel=rbind((tm_abs/rowSums(tm_abs))[1:7,],c(rep(0,7),1))

## Derive quasi optimization generator matrix estimate
gmqo=gmQO(tm_rel,1)
gmqo



