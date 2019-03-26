library(MixAll)


### Name: clusterPoisson
### Title: Create an instance of the ['ClusterPoisson'] class
### Aliases: clusterPoisson

### ** Examples

## A quantitative example with the DebTrivedi data set.
data(DebTrivedi)
dt <- DebTrivedi[1:500, c(1, 6,8, 15)]

model <- clusterPoisson( data=dt, nbCluster=2
                       , models=clusterPoissonNames(prop = "equal")
                       , strategy = clusterFastStrategy())

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




