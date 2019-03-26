library(OrdinalLogisticBiplot)


### Name: PlotClusters
### Title: Graphical representation of clusters of individuals.
### Aliases: PlotClusters
### Keywords: cluster

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd)
x = olbo$RowCoords[, 1]
y = olbo$RowCoords[, 2]
plot(x,y, cex = 0.8, pch=17, xlim=c(-2,2),ylim=c(-2,2))
GroupsF = as.factor(LevelSatPhd[,4])
PlotClusters(olbo$RowCoords, Groups = GroupsF,
    colors = c(1,2,3,4),chulls = TRUE,centers = TRUE,ConfidentLevel=NULL)




