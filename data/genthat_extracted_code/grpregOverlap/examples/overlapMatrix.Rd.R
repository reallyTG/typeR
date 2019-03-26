library(grpregOverlap)


### Name: overlapMatrix
### Title: Compute a matrix indicating overlaps between groups
### Aliases: overlapMatrix

### ** Examples

data(pathway.dat)
X <- pathway.dat$expression
group <- pathway.dat$pathways
overlap.mat <- overlapMatrix(X, group)



