library(TBEST)


### Name: plot.best
### Title: Plot a dendrogam of a hierarchical cluster with branches labeled
###   by their numbers and significance estimates of tightness.
### Aliases: plot.best plot

### ** Examples

## Not run: 
##D data(leukemia)
##D mytable<-SigTree(data.matrix(leukemia),mystat="all",
##D         mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D         distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D plot(x=mytable,mystat="fldc",siglevel=0.001,sigtype="raw",hang=-1)
##D mypartition<-PartitionTree(x=mytable,siglevel=0.001,statname="fldc",
##D         sigtype="raw")
##D plot(x=mytable,mystat="fldc",partition=mypartition)
##D plot(x=mytable,mystat="fldc",partition=mypartition,print.num=F)
##D #with user-defined functions
##D mydist<-function(x,y){return(dist(x)/y)}
##D myrand<-function(x,z){return(apply(x+z,2,sample))}
##D mytable<-SigTree(data.matrix(leukemia),mystat="fldc",
##D 	mymethod="ward",mymetric="mydist",rand.fun="myrand",
##D 	distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="MOM",metric.args=list(3),
##D 	rand.args=list(2))
##D plot(mytable,metric.args=list(3))
##D plot(mytable,metric.args=list(3),cex.leaf=1.5)
## End(Not run)



