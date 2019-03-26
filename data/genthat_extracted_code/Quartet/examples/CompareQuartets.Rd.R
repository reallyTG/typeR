library(Quartet)


### Name: CompareQuartets
### Title: Compare quartet states by explicit enumeration
### Aliases: CompareQuartets

### ** Examples

  n_tip <- 6
  trees <- list(ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL),
                ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL))
  splits <- lapply(trees, TreeSearch::Tree2Splits)
  quartets <- QuartetStates(splits)
  CompareQuartets(quartets[[1]], quartets[[2]])




