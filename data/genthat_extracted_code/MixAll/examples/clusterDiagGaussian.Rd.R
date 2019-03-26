library(MixAll)


### Name: clusterDiagGaussian
### Title: Create an instance of the ['ClusterDiagGaussian'] class
### Aliases: clusterDiagGaussian

### ** Examples

## A quantitative example with the famous geyser data set
data(geyser)
## add 10 missing values as random
x = as.matrix(geyser); n <- nrow(x); p <- ncol(x);
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
x[indexes] <- NA;
## estimate model (using fast strategy, results may be misleading)
model <- clusterDiagGaussian( data=x, nbCluster=2:3
                            , models=c( "gaussian_pk_sjk")
                            , strategy = clusterFastStrategy()
                            )

## use graphics functions
## Not run: 
##D plot(model)
## End(Not run)

## get summary
summary(model)
## print model
## Not run: 
##D print(model)
## End(Not run)
## get estimated missing values
missingValues(model)




