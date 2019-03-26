library(Perc)


### Name: findAllPaths
### Title: Identifies all paths between all pairs of less than or equal to
###   a certain length
### Aliases: findAllPaths

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find all paths of legnth 3
allp.3 <- findAllPaths(confmatrix, 3)



