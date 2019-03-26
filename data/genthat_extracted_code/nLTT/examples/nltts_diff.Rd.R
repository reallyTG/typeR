library(nLTT)


### Name: nltts_diff
### Title: Calculates the nLTT statistic between each phylogeny in a
###   collection compared to a same focal/reference tree
### Aliases: nltts_diff

### ** Examples

  tree <- ape::rcoal(4)
  trees <- c(ape::rcoal(4), ape::rcoal(4))
  nltts <- nltts_diff(tree, trees)
  testit::assert(all(nltts >= 0.0 && nltts <= 1.0))



