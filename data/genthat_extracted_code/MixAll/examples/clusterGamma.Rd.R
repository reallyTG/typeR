library(MixAll)


### Name: clusterGamma
### Title: Create an instance of the ['ClusterGamma'] class
### Aliases: clusterGamma

### ** Examples

## A quantitative example with the famous geyser data set
data(geyser)
## add 10 missing values
x = geyser;
x[round(runif(5,1,nrow(geyser))), 1] <- NA
x[round(runif(5,1,nrow(geyser))), 2] <- NA

## use graphics functions
model <- clusterGamma( data=x, nbCluster=2:3
                     , models="gamma_pk_ajk_bjk"
                     , strategy = clusterFastStrategy())

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




