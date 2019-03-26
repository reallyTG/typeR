library(metacart)


### Name: REmrt
### Title: Random effects meta-tree
### Aliases: REmrt

### ** Examples

data(dat.BCT2009)
REtree <- REmrt(g ~ T1 + T2+ T4 +T25, vi = vi, data = dat.BCT2009, c = 0)
summary(REtree)
plot(REtree)



