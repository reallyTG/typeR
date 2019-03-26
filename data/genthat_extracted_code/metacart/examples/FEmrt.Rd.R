library(metacart)


### Name: FEmrt
### Title: Fixed effect meta-tree
### Aliases: FEmrt

### ** Examples

data(dat.BCT2009)
FEtree <- FEmrt(g ~ T1 + T2+ T4 + T25, vi = vi, data = dat.BCT2009, c = 0.5)
print(FEtree)
summary(FEtree)
plot(FEtree)



