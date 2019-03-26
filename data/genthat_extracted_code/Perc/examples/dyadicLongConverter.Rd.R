library(Perc)


### Name: dyadicLongConverter
### Title: dyadic long format converter
### Aliases: dyadicLongConverter

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find win-loss probability matrix
perm2 <- conductance(confmatrix, 2)
perm2$imputed.conf
perm2$p.hat
dl <- dyadicLongConverter(perm2$p.hat)



