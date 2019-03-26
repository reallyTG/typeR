library(SOMbrero)


### Name: superClass
### Title: Create super-clusters from SOM clustering
### Aliases: superClass superClass.somRes print.somSC summary.somSC
###   projectIGraph.somSC plot.somSC
### Keywords: classes

### ** Examples

set.seed(11051729)
my.som <- trainSOM(x.data=iris[,1:4])
# choose the number of super-clusters
sc <- superClass(my.som)
plot(sc)
# cut the clustering
sc <- superClass(my.som, k=4)
summary(sc)
plot(sc)
plot(sc, type="hitmap", plot.legend=TRUE)



