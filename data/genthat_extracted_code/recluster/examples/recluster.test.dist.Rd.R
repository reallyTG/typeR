library(recluster)


### Name: recluster.test.dist
### Title: Test variation lost by a bidimensional configuration when the
###   coordinates of the elements are reduced to the configuration of the
###   barycentres of a given series of groups.
### Aliases: recluster.test.dist
### Keywords: cluster

### ** Examples

data(dataisl)
#Define groups of islands
memb<-c(2,3,5,7,5,3,1,1,2,5,1,3,1,1,5,2,2,1,2,4,1,3,1,5,2,1,7,6,1,1,1) 
#Compute bidimensional representation for elements
pcoa<-cmdscale(recluster.dist(dataisl))
bar<-aggregate(pcoa~memb,FUN="mean")[,2:3]
# test if the variation has been significantly lost
recluster.test.dist(pcoa,bar,memb,perm=100)



