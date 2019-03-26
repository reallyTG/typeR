library(MixAll)


### Name: clusterPredict
### Title: Create an instance of ['ClusterPredict'] class
### Aliases: clusterPredict

### ** Examples

## A quantitative example with the famous iris data set
data(iris)
## get quantitatives 
x = as.matrix(iris[1:4])
## sample train and test data sets
indexes <- sample(1:nrow(x), nrow(x)/2)
train <- x[ indexes,]
test  <- x[-indexes,]
## estimate model (using fast strategy, results may be misleading)
model1 <- clusterDiagGaussian( data =train, nbCluster=2:3
                             , models=c( "gaussian_p_sjk")
                             )
## get summary
summary(model1)
## compute prediction and compare
model2 <- clusterPredict(test, model1)
show(model2)
as.integer(iris$Species[-indexes])




