library(funcy)


### Name: funcyOutList-class
### Title: Class '"funcyOutList"'
### Aliases: funcyOutList-class funcyOutList
### Keywords: classes

### ** Examples

set.seed(2808)
ds <- sampleFuncy(obsNr=30, k=4, timeNr=7)
data <- Data(ds)
clusters <- Cluster(ds)

res <- funcit(data=data, clusters=clusters, seed=2808,
              methods=1:5, k=4, parallel=TRUE)
class(res)
summary(res)



