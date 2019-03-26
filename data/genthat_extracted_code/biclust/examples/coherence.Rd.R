library(biclust)


### Name: coherence
### Title: Coherence measures
### Aliases: coherence constantVariance additiveVariance
###   multiplicativeVariance signVariance
### Keywords: array cluster

### ** Examples

  #Simplified yeast microarray data
  data(BicatYeast)
  set.seed(1)
  bics1 <- biclust(BicatYeast,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m + a + b,
  row.release = 0.7, col.release = 0.7,
  verbose = FALSE, max.layers = 10, iter.startup = 5,
  iter.layer = 30)
  
  constantVariance(BicatYeast, bics1,1,"row")
  constantVariance(BicatYeast, bics1,1,"col")
  constantVariance(BicatYeast, bics1,1,"both")
  additiveVariance(BicatYeast, bics1,1,"both")
  multiplicativeVariance(BicatYeast, bics1,1,"both")
  signVariance(BicatYeast, bics1,1,"both")
  


