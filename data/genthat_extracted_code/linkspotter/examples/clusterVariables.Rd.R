library(linkspotter)


### Name: clusterVariables
### Title: Variable clustering (using Normal Mixture Modeling for
###   Model-Based Clustering : mclust)
### Aliases: clusterVariables

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF <- multiBivariateCorrelation(dataset = iris, corMethods = "MaxNMI")
# tranform to correlation matrix
corMatrix <- corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"MaxNMI")])
# perform the clustering
corGroups <- clusterVariables(corMatrix = corMatrix, nbCluster = 3)
print(corGroups)




