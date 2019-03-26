library(Perc)


### Name: plotConfmat
### Title: generate heat map for a matrix
### Aliases: plotConfmat

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find win-loss probability matrix
perm2 <- conductance(confmatrix, 2)
# plotting
plotConfmat(perm2$p.hat)



