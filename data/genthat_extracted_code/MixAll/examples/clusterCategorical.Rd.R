library(MixAll)


### Name: clusterCategorical
### Title: Create an instance of the ['ClusterCategorical'] class
### Aliases: clusterCategorical

### ** Examples

## A quantitative example with the birds data set
data(birds)
## add 10 missing values
x = as.matrix(birds); n <- nrow(x); p <- ncol(x)
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2)
x[indexes] <- NA
## estimate model (using fast strategy, results may be misleading)
model <- clusterCategorical( data=x, nbCluster=2:3
                           , models=c( "categorical_pk_pjk", "categorical_p_pjk")
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




