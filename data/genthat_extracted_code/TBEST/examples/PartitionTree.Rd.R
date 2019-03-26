library(TBEST)


### Name: PartitionTree
### Title: Find the most detailed partition of a tree into tight branches.
### Aliases: PartitionTree

### ** Examples

## Not run: 
##D data(leukemia)
##D mytable<-SigTree(data.matrix(leukemia),mystat="all",
##D         mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D         distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D mypartition<-PartitionTree(x=mytable,siglevel=0.001,statname="fldc",
##D         sigtype="raw")
##D partition1<-mypartition$partition
##D sigmatrix1<-mypartition$sigvalue
##D fix(partition1)
##D fix(sigmatrix1)
## End(Not run)



