library(lineup)


### Name: findCommonID
### Title: Find individuals in common between a cross and a phenotype
###   matrix
### Aliases: findCommonID
### Keywords: utilities

### ** Examples


data(f2cross, expr1)

# align IDs
id <- findCommonID(f2cross, expr1)

# aligned data
f2cross_aligned <- f2cross[,id$first]
expr1_aligned <- expr1[id$second,]




