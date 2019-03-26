library(Claddis)


### Name: DiscreteCharacterRate
### Title: Discrete character rates across trees, time, and character types
### Aliases: DiscreteCharacterRate
### Keywords: evolution,rates

### ** Examples


# Set random seed:
set.seed(17)

# Generate a random tree for the Michaux data set:
tree <- rtree(nrow(Michaux1989$Matrix_1$Matrix))

# Update taxon names to match those in the data matrix:
tree$tip.label <- rownames(Michaux1989$Matrix_1$Matrix)

# Set root time by making youngest taxon extant:
tree$root.time <- max(diag(vcv(tree)))

# Get discrete character rates:
x <- DiscreteCharacterRate(tree = tree, CladisticMatrix =
  Michaux1989, TimeBins = seq(from = tree$root.time,
  to = 0, length.out = 5), BranchPartitionsToTest =
  lapply(as.list(1:nrow(tree$edge)), as.list),
  CharacterPartitionsToTest = lapply(as.list(1:3),
  as.list), CladePartitionsToTest =
  lapply(as.list(Ntip(tree) + (2:Nnode(tree))),
  as.list), TimeBinPartitionsToTest =
  lapply(as.list(1:4), as.list), ChangeTimes =
  "random", Alpha = 0.01, PolymorphismState =
  "missing", UncertaintyState = "missing",
  InapplicableState = "missing", TimeBinApproach =
  "Lloyd")




