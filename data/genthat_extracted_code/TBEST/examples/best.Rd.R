library(TBEST)


### Name: best
### Title: An object of class "best"
### Aliases: best

### ** Examples

## Not run: 
##D data(leukemia)
##D mytable<-SigTree(data.matrix(leukemia),mystat="all",
##D        mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D        distrib="Rparallel",njobs=2,Ptail=TRUE,tailmethod="ML")
##D class(mytable)
##D names(mytable)
##D mytable<-SigTree(data.matrix(leukemia),mystat="slb",
##D        mymethod="ward",mymetric="euclidean",rand.fun="shuffle.column",
##D        distrib="Rparallel",njobs=2,Ptail=FALSE)
##D class(mytable)
##D names(mytable)
## End(Not run)



