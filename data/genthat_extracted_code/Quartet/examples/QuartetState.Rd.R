library(Quartet)


### Name: QuartetState
### Title: Quartet State(s)
### Aliases: QuartetState QuartetStates

### ** Examples

{
  n_tip <- 6
  trees <- list(ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL),
                ape::rtree(n_tip, tip.label=seq_len(n_tip), br=NULL))
  splits <- lapply(trees, TreeSearch::Tree2Splits)
  QuartetState(c(1, 3, 4, 6), splits[[2]])  
  QuartetState(1:4, splits[[1]]) == QuartetState(1:4, splits[[2]])
  vapply(AllQuartets(n_tip), QuartetState, bips=splits[[1]], double(1))
}




