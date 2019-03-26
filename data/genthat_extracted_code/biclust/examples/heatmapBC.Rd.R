library(biclust)


### Name: heatmapBC
### Title: Overlapping Heatmap
### Aliases: heatmapBC
### Keywords: hplot cluster

### ** Examples

  set.seed(1234)
  data(BicatYeast)
  resplaid <- biclust(BicatYeast, BCPlaid(), verbose = FALSE)
  heatmapBC(x = BicatYeast, bicResult = resplaid)




