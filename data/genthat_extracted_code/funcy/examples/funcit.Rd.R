library(funcy)


### Name: funcit
### Title: Functional Cluster Analysis
### Aliases: funcit
### Keywords: cluster

### ** Examples

##Cluster the data with methods for regular sets
##Sample a regular dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=50, k=4, timeNr=8, reg=TRUE)

##Cluster the functions with all available methods. 
res <- funcit(data=Data(ds), clusters=Cluster(ds),
              methods=c(1,2,3,4), seed=2404,
              k=4)
summary(res)
Cluster(res)

##Additional method specific parameters for method fitfclust
res <- funcit(data=Data(ds), clusters=Cluster(ds), methods="fitfclust", seed=2405,
              k=4, p=5, pert=0)


##Cluster the data with methods for irregular sets
##Sample an irregular dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=50, k=4, timeNrMin=4, timeNrMax=8,
                  reg=FALSE)
data <- Data(ds)
clusters <- Cluster(ds)

res <- funcit(data=data, clusters=clusters,
              methods=c("fitfclust","distclust", "iterSubspace"), seed=2406,
              k=4, parallel=TRUE)

summary(res)
Cluster(res)
plot(res)

##Two reallife examples
## Not run: 
##D data("genes")
##D data <- genes$data
##D clusters <- genes$clusters
##D 
##D ##Cluster the functions with all available methods. 
##D res <- funcit(data=data, clusters=clusters,
##D               methods=1:7, seed=2404,
##D               k=4)
##D summary(res)
##D Cluster(res)
## End(Not run)

## Not run: 
##D data("electricity")
##D res <- funcit(data=electricity, methods=c("fitfclust","distclust",
##D "waveclust"), seed=2406, k=5, parallel=TRUE)
##D plot(res, legendPlace="topleft")
## End(Not run)



