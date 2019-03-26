library(cheddar)


### Name: Node connectivity
### Title: Node connectivity
### Aliases: IsBasalNode IsTopLevelNode IsIntermediateNode IsIsolatedNode
###   IsConnectedNode IsNonBasalNode IsNonTopLevelNode BasalNodes
###   TopLevelNodes IntermediateNodes IsolatedNodes ConnectedNodes
###   NonBasalNodes NonTopLevelNodes FractionBasalNodes
###   FractionIntermediateNodes FractionTopLevelNodes FractionIsolatedNodes
###   FractionNonConnectedNodes FractionNonBasalNodes
###   FractionConnectedNodes FractionNonTopLevelNodes
### Keywords: utilities

### ** Examples

data(TL84)

# Assemble a table of node connectivity. Only one of each of the following 
# four properties is TRUE for each node.
connectivity <- NPS(TL84, c('IsBasalNode', 'IsIsolatedNode', 
                            'IsIntermediateNode', 'IsTopLevelNode'))
connectivity

# Each row sums to 1, confirming that exactly one of the columns in each row 
# is TRUE.
all(1==rowSums(connectivity))

# These summations are 1
sum(FractionBasalNodes(TL84), 
    FractionIntermediateNodes(TL84), 
    FractionTopLevelNodes(TL84), 
    FractionIsolatedNodes(TL84))

sum(FractionConnectedNodes(TL84), 
    FractionIsolatedNodes(TL84))

sum(FractionBasalNodes(TL84), 
    FractionNonBasalNodes(TL84))

sum(FractionTopLevelNodes(TL84), 
    FractionNonTopLevelNodes(TL84))



