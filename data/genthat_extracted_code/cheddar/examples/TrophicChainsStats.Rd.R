library(cheddar)


### Name: TrophicChainsStats
### Title: Trophic chains statistics
### Aliases: TrophicChainsStats
### Keywords: utilities

### ** Examples

data(TL84)
chain.stats <- TrophicChainsStats(TL84)

# The length of every chain
length(chain.stats$chain.lengths)    # 5,988 chains
summary(chain.stats$chain.lengths)

# The number of chains in which a node appears in that position in a chain
chain.stats$node.pos.counts

# Basal nodes only have counts in the first column.
chain.stats$node.pos.counts[BasalNodes(TL84),]

# Consumers only have counts in columns two and up.
chain.stats$node.pos.counts[c(IntermediateNodes(TL84),TopLevelNodes(TL84)),]

# All counts are zero for isolated nodes IsolatedNodes.
chain.stats$node.pos.counts[IsolatedNodes(TL84),]



