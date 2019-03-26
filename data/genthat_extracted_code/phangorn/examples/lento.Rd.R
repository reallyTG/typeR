library(phangorn)


### Name: lento
### Title: Lento plot
### Aliases: lento
### Keywords: cluster plot

### ** Examples


data(yeast)
yeast.ry <- acgt2ry(yeast)
splits.h <- h2st(yeast.ry)
lento(splits.h, trivial=TRUE) 




