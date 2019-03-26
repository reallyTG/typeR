library(TBEST)


### Name: SigTree
### Title: Perform statistical analysis of tightness for branches of a
###   hierarchical cluster.
### Aliases: SigTree

### ** Examples

####Each column is a gene expression profile for a case of leukemia. 
####Each case belongs to one of three subtypes.
data(leukemia)
#output only statistic table
mytable<-SigTree(data.matrix(leukemia),mystat="all",
        mymethod="ward",mymetric="euclidean")
class(mytable)
## Not run: 
##D #use multicore processing to detect significant sub-clusters
##D mytable<-SigTree(data.matrix(leukemia),mystat="all",
##D 	mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D 	distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D class(mytable)
##D ####Each row after the 1st describes an item belonging to one of four subtypes. 
##D ####Each column corresponds to a genomic location in one of 22 human chromosomes. 
##D ####The 1st row contains the chromosome numbers.
##D data(T10)
##D #Perform randomization within each chromosome
##D chrom<-as.numeric(T10[1,])
##D mydata<-T10[-1,] 
##D mytable<-SigTree(data.matrix(mydata),mystat="fldc",        
##D 	mymethod="ward",mymetric="euclidean",rand.fun="shuffle.block",
##D 	by.block=chrom,distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D #Compute dissimilarity using a user-supplied distance function,
##D #and perform randomization using a user-supplied randomization function, 
##D #with additional arguments. 
##D #Both user-supplied functions are only useful as illustration.
##D mydist<-function(x,y){return(dist(x)/y)}
##D myrand<-function(x,z){return(apply(x+z,2,sample))}
##D mytable<-SigTree(data.matrix(leukemia),mystat="fldc",
##D mymethod="ward",mymetric="mydist",rand.fun="myrand",
##D distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="MOM",metric.args=list(3),
##D rand.args=list(2))
## End(Not run)



