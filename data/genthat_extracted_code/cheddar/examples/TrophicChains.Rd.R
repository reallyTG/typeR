library(cheddar)


### Name: TrophicChains
### Title: Trophic chains
### Aliases: TrophicChains
### Keywords: utilities

### ** Examples

data(TL84)

tc <- TrophicChains(TL84)

# Every chain starts with a basal node
BasalNodes(TL84)
first <- tc[,1]
all(IsBasalNode(TL84)[unique(first)])

# TL84 has a single top-level consumer - every trophic chain ends with this 
# consumer
TopLevelNodes(TL84)
# Get the last node in each chain
last <- apply(tc, 1, function(row) row[max(which(""!=row))])
unique(last)

# M of nodes
head(TrophicChains(TL84, node.properties='M'))

# M and N of nodes
head(TrophicChains(TL84, node.properties=c('M','N')))

# Skipwith Pond has more than 10e5 unique chains
data(SkipwithPond)
# Not all systems will be able to allocate the memory required to hold the 
# chains
## Not run: dim(TrophicChains(SkipwithPond))



