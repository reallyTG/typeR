library(TBEST)


### Name: partition
### Title: An object of class "partition"
### Aliases: partition

### ** Examples

## Not run: 
##D data(leukemia)
##D mytable<-SigTree(data.matrix(leukemia),mystat="all",
##D        mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D        distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D class(mytable)
##D mypartition<-PartitionTree(x=mytable,siglevel=0.001,statname="fldc",
##D        sigtype="raw")
##D class(mypartition)
##D names(mypartition)
## End(Not run)



