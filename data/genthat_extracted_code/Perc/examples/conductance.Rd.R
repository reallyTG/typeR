library(Perc)


### Name: conductance
### Title: compute win-loss probabilities
### Aliases: conductance

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find win-loss probability matrix
perm2 <- conductance(confmatrix, 2, strict = FALSE)
perm2$imputed.conf
perm2$p.hat



