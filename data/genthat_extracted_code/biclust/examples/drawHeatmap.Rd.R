library(biclust)


### Name: drawHeatmap
### Title: Draw Heatmap
### Aliases: drawHeatmap drawHeatmap2 heatmap
### Keywords: hplot cluster

### ** Examples

  #Random 100x50 matrix with a single, up-regulated 10x10 bicluster
  s2=matrix(rnorm(5000),100,50)
  s2[11:20,11:20]=rnorm(100,3,0.3)
  set.seed(1)
  bics <- biclust(s2,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m + a + b,
  iter.startup = 5, iter.layer = 30,  verbose = TRUE)
  drawHeatmap(s2,bics,1)




