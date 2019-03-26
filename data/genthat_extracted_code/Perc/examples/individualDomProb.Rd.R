library(Perc)


### Name: individualDomProb
### Title: individual-level probability converter
### Aliases: individualDomProb

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find win-loss probability matrix
perm2 <- conductance(confmatrix, 2)
perm2$imputed.conf
perm2$p.hat
individualLevelOutput <- individualDomProb(perm2$p.hat)



