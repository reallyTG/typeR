library(foodweb)


### Name: analyse.list
### Title: Calculate Network Parameters from Multiple, Binary,
###   Predator-prey Matrices Whose Names Are Provided in a List
### Aliases: analyse.list

### ** Examples

## Not run: 
##D data(moss)
##D write.table(moss,file="Web1.csv", append=FALSE,sep=",", row.names=FALSE, col.names=FALSE)
##D write.table(moss[-(2:4), -(8:10)],file="Web2.csv", append=FALSE,sep=",", 
##D row.names=FALSE, col.names=FALSE)
##D write.table(rbind("Web1.csv", "Web2.csv"), file="Mylist.csv", append=FALSE, sep=",", 
##D row.names=FALSE, col.names=FALSE)
##D analyse.list(list="Mylist.csv", maxlevels=4, sp.names="FALSE")
##D 
## End(Not run)


