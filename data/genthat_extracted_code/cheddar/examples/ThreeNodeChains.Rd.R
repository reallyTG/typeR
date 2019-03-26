library(cheddar)


### Name: ThreeNodeChains
### Title: Three-node chains
### Aliases: ThreeNodeChains
### Keywords: utilities

### ** Examples

data(TL84)

nrow(ThreeNodeChains(TL84))
nrow(ThreeNodeChains(TL84, exclude.loops=TRUE))

# bottom, intermediate and top
head(ThreeNodeChains(TL84))

# bottom, intermediate, top, bottom.M, intermediate.M and top.M
head(ThreeNodeChains(TL84, node.properties='M'))

# As above with the addition of bottom.N, intermediate.N and top.N
head(ThreeNodeChains(TL84, node.properties=c('M','N')))



