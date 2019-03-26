library(Claddis)


### Name: GetAllStateChanges
### Title: Finds all state changes on a tree using stochastic character
###   mapping
### Aliases: GetAllStateChanges

### ** Examples


# Set random seed:
set.seed(2)

# Use Day 2016 as source matrix:
CladisticMatrix <- Day2016

# Prune out continuous characters:
CladisticMatrix <- MatrixPruner(CladisticMatrix =
  CladisticMatrix, blocks2prune = 1)

# Prune out majority of characters so
# example runs quickly:
CladisticMatrix <- MatrixPruner(CladisticMatrix =
  CladisticMatrix, characters2prune = 1:32)

# Generete random tree for matrix taxa:
Tree <- rtree(nrow(Day2016$Matrix_1$Matrix))

# Add taxon names to tree:
Tree$tip.label <- rownames(Day2016$Matrix_1$Matrix)

# Add root age to tree:
Tree$root.time <- max(diag(vcv(Tree)))

# Get all state changes for two simulations:
StateChanges <-
  GetAllStateChanges(CladisticMatrix = CladisticMatrix,
  Tree = Tree, TimeBins = seq(Tree$root.time, 0,
  length.out = 3), NSimulations = 2)

# View matrix of all stochstic character changes:
StateChanges$AllStateChanges

# View vector of sampled time for each
# character:
StateChanges$CharacterTimes

# View matrix of edge lengths in each time bin:
StateChanges$EdgeLengthsPerBin

# View matrix of termnial edge lengths in each time bin:
StateChanges$TerminalEdgeLengthsPerBin

# View matrix of internal edge lengths in each time bin:
StateChanges$InternalEdgeLengthsPerBin




