library(nLTT)


### Name: nLTTstat
### Title: Calculate the difference between two normalized
###   Lineage-Through-Time curves, given two phylogenetic trees.
### Aliases: nLTTstat

### ** Examples

  data(exampleTrees)
  nltt_plot(exampleTrees[[1]])
  nltt_lines(exampleTrees[[2]], lty=2)
  nLTTstat(
    exampleTrees[[1]], exampleTrees[[2]],
    distance_method = "abs", ignore_stem = TRUE)



