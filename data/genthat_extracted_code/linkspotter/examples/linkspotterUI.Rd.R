library(linkspotter)


### Name: linkspotterUI
### Title: Linspotter user interface runner
### Aliases: linkspotterUI

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF=multiBivariateCorrelation(dataset = iris)
corMatrix=corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"MaxNMI")])
corGroups=clusterVariables(corMatrix = corMatrix, nbCluster = 3)
## Not run: 
##D # launch the UI
##D linkspotterUI(dataset=iris, corDF=corDF, variablesClustering=corGroups,
##D defaultMinCor=0.3,cappTitle="Linkspotter on iris data",
##D options = list(port=8000)
##D )
## End(Not run)




