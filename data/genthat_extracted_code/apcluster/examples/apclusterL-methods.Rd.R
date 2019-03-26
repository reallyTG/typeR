library(apcluster)


### Name: apclusterL
### Title: Leveraged Affinity Propagation
### Aliases: apclusterL apclusterL-methods apclusterL,matrix,missing-method
###   apclusterL,character,ANY-method apclusterL,function,ANY-method
### Keywords: cluster

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(150, 0.2, 0.05), rnorm(150, 0.8, 0.06))
cl2 <- cbind(rnorm(100, 0.7, 0.08), rnorm(100, 0.3, 0.05))
x <- rbind(cl1, cl2)

## leveraged apcluster
apres <- apclusterL(negDistMat(r=2), x, frac=0.2, sweeps=3, p=-0.2)

## show details of leveraged clustering results
show(apres)

## plot leveraged clustering result
plot(apres, x)

## plot heatmap of clustering result
heatmap(apres)

## show net similarities of single sweeps
apres@netsimLev

## show samples on which best sweep was based
apres@sel



