library(foodweb)


### Name: analyse.seq
### Title: Calculate Network Parameters from Multiple, Binary,
###   Predator-prey Matrices Contained in Files That Are Named Sequentially
### Aliases: analyse.seq

### ** Examples

## Not run: 
##D data(moss)
##D write.table(moss,file="Web1.csv", append=FALSE,sep=",", row.names=FALSE, col.names=FALSE)
##D write.table(moss[-(2:4), -(8:10)],file="Web2.csv", append=FALSE,sep=",", 
##D row.names=FALSE, col.names=FALSE)
##D analyse.seq(prefix="Web", suffix=".csv", first=1, last=2, maxlevels=4, sp.names="FALSE")
## End(Not run)


