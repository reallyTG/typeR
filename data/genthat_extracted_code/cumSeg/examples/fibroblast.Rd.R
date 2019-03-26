library(cumSeg)


### Name: fibroblast
### Title: Fibroblast Cell Line dataset
### Aliases: fibroblast
### Keywords: datasets

### ** Examples

## Not run: 
##D data(fibroblast)
##D #select chromosome 1
##D z<-na.omit(fibroblast$gm03563[fibroblast$Chromosome==1]) 
##D o<-jumpoints(z,k=30,output="3")
##D plot(z)
##D plot(o,add=TRUE,y=FALSE,col=4)
## End(Not run)



