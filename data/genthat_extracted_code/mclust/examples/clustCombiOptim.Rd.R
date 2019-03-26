library(mclust)


### Name: clustCombiOptim
### Title: Optimal number of clusters obtained by combining mixture
###   components
### Aliases: clustCombiOptim
### Keywords: cluster

### ** Examples

data(Baudry_etal_2010_JCGS_examples)
output <- clustCombi(data = ex4.1) 
combiOptim <- clustCombiOptim(output)
str(combiOptim)

# plot optimal clustering with alpha color transparency proportional to uncertainty
zmax <- apply(combiOptim$z.combi, 1, max)
col <- mclust.options("classPlotColors")[combiOptim$cluster.combi]
vadjustcolor <- Vectorize(adjustcolor)
alphacol = (zmax - 1/combiOptim$numClusters.combi)/(1-1/combiOptim$numClusters.combi)
col <- vadjustcolor(col, alpha.f = alphacol)
plot(ex4.1, col = col, pch = mclust.options("classPlotSymbols")[combiOptim$cluster.combi])



