library(funcy)


### Name: accordance
### Title: Accordance for cluster outcomes from different methods.
### Aliases: accordance

### ** Examples

##Generate dataset
k <- 3
set.seed(2511)
ds <- sampleFuncy(obsNr=30, timeNr=10, reg=TRUE, k=k, sd=.4)
 
##Cluster dataset
res1 <- funcit(methods=1:3, data=Data(ds), k=4, clusters=Cluster(ds))

##Retrieve clusters and centers
cl <- Cluster(res1)
ctr <- Center(res1)

accordance(cl, ctr, relabel=TRUE)



