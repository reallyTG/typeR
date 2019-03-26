library(Perc)


### Name: countPaths
### Title: count paths between all pairs
### Aliases: countPaths

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find number of paths of length 3 or less
npaths <- countPaths(confmatrix, 3)



