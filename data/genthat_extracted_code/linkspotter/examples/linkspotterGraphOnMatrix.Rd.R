library(linkspotter)


### Name: linkspotterGraphOnMatrix
### Title: Linspotter graph on matrix
### Aliases: linkspotterGraphOnMatrix

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF=multiBivariateCorrelation(dataset = iris)
corMatrix=corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"pearson")])
# launch the graph
linkspotterGraphOnMatrix(corMatrix=corMatrix, minCor=0.3)




