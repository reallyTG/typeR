library(MasterBayes)


### Name: orderPed
### Title: Orders a Pedigree
### Aliases: orderPed
### Keywords: manip

### ** Examples

## Not run: 
##D pedigree<-matrix(NA, 8,3)
##D pedigree[,1]<-1:8
##D pedigree[,2][5:8]<-c(1,1,2,2)
##D pedigree[,3][5:8]<-c(3,3,4,4)
##D 
##D pedigree<-pedigree[sample(1:8),]
##D 
##D pedigree2<-orderPed(pedigree)
## End(Not run)



