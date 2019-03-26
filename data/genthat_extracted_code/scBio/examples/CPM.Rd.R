library(scBio)


### Name: CPM
### Title: The Cellular Population Mapping (CPM) algorithm.
### Aliases: CPM

### ** Examples

data(SCLabels)
data(SCFlu)
data(BulkFlu)
data(SCCellSpace)

# Creating relative bulk data (Infleunza infection compared to PBS):
BulkFluReduced = BulkFlu - rowMeans(BulkFlu[,grep("pbs",colnames(BulkFlu))])
BulkFluReduced = BulkFluReduced[,grep("flu",colnames(BulkFluReduced))]

# Running CPM using only a single cell-type:
oneCellTypeIndexes = which(SCLabels == "MPS")
res = CPM(SCData = SCFlu[,oneCellTypeIndexes], SCLabels = SCLabels[oneCellTypeIndexes],
          BulkData = BulkFluReduced, cellSpace = SCCellSpace[oneCellTypeIndexes,], no_cores = 2)

## Not run: 
##D 
##D # Running CPM using a variety of cell-types:
##D res = CPM(SCFlu, SCLabels, BulkFluReduced, SCCellSpace, no_cores = 2)
##D ### Full multi-threading : CPM(SCFlu, SCLabels, BulkFluReduced, SCCellSpace)
## End(Not run)



