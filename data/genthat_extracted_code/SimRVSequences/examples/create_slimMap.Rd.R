library(SimRVSequences)


### Name: create_slimMap
### Title: Create recombination map
### Aliases: create_slimMap

### ** Examples

#load hg_exons data
data(hg_exons)

#since the exons in hg_exons have already been combined into
#overlapping exons, we supply hg_exons to create_slimMap
slimMap <- create_slimMap(hg_exons)
head(slimMap)

# restrict output to the variables required by SLiM
slimMap <- slimMap[, c("recRate", "mutRate", "endPos")]

# shift endPos up by one unit
slimMap$endPos <- slimMap$endPos - 1

# print first four rows of slimMap
head(slimMap, n = 4)




