library(FactoMineR)


### Name: plot.HCPC
### Title: Plots for Hierarchical Classification on Principle Components
###   (HCPC) results
### Aliases: plot.HCPC
### Keywords: dplot

### ** Examples

data(iris)
# Clustering, auto nb of clusters:
res.hcpc=HCPC(iris[1:4], nb.clust=3)
# 3D graph from a different point of view:
plot(res.hcpc, choice="3D.map", angle=60)



