library(biclust)


### Name: parallelCoordinates
### Title: Parallel Coordinates
### Aliases: parallelCoordinates 'parallel coordinates'
### Keywords: hplot cluster

### ** Examples

  #Random 100x50 matrix with a single, up-regulated 10x10 bicluster
  s2=matrix(rnorm(5000),100,50)
  s2[11:20,11:20]=rnorm(100,3,0.3)
  set.seed(1)
  bics <- biclust(s2,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m + a + b,
  iter.startup = 5, iter.layer = 30,  verbose = TRUE)
  parallelCoordinates(x=s2,bicResult=bics,number=1, plotBoth=TRUE,
plotcol=TRUE, compare=TRUE, info=TRUE,bothlab=c("Genes Bicluster
1","Conditions Bicluster 1"), order =TRUE)
  parallelCoordinates(x=s2,bicResult=bics,number=1, plotBoth=FALSE, plotcol=TRUE, 
    compare=FALSE, info=TRUE)



