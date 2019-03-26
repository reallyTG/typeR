library(VisuClust)


### Name: LinkageMap
### Title: Displays a Linkage Map
### Aliases: LinkageMap

### ** Examples


library(MASS)

data("MilchSmall")
M <- scale(MilchSmall[3:6])

D <- dist(M)
S <- sammon(D)
K <- kmeans(D,center=5)
LinkageMap(S$points, D, cluster=K$cluster, labels=MilchSmall[,2])




