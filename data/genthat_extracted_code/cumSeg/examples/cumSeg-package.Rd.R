library(cumSeg)


### Name: cumSeg-package
### Title: Change point detection and estimation in genomic sequences
### Aliases: cumSeg-package cumSeg
### Keywords: package models

### ** Examples

## Not run: 
##D library(cumSeg)
##D data(fibroblast)
##D #select chromosomes 1.. but the same for chromosomes 3,9,11
##D z<-na.omit(fibroblast$gm03563[fibroblast$Chromosome==1]) 
##D o<-jumpoints(z,k=30,output="3")
##D plot(z)
##D plot(o,add=TRUE,y=FALSE,col=4)
## End(Not run)



