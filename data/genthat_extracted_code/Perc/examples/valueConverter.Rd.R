library(Perc)


### Name: valueConverter
### Title: win-loss probability matrix value converter
### Aliases: valueConverter

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find win-loss probability matrix
perm2 <- conductance(confmatrix, 2)
perm2$imputed.conf
perm2$p.hat
convertedValue <- valueConverter(perm2$p.hat)



