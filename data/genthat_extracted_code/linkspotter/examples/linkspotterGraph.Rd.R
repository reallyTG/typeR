library(linkspotter)


### Name: linkspotterGraph
### Title: Linspotter graph runner
### Aliases: linkspotterGraph

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF=multiBivariateCorrelation(dataset = iris)
corMatrix=corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"spearman")])
corGroups=clusterVariables(corMatrix = corMatrix, nbCluster = 3)
# launch the graph
linkspotterGraph(corDF=corDF, variablesClustering=corGroups, minCor=0.3,
corMethod='spearman', colorEdgesByCorDirection=TRUE)




