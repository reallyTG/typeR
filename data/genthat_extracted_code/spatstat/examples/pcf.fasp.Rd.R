library(spatstat)


### Name: pcf.fasp
### Title: Pair Correlation Function obtained from array of K functions
### Aliases: pcf.fasp
### Keywords: spatial nonparametric

### ** Examples

  # multitype point pattern
  KK <- alltypes(amacrine, "K")
  p <- pcf.fasp(KK, spar=0.5, method="b")
  plot(p)
  # strong inhibition between points of the same type



