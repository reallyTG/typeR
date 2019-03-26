library(isopam)


### Name: isopam
### Title: Isopam (Clustering)
### Aliases: isopam plot.isopam identify.isopam
### Keywords: cluster

### ** Examples

     ## load data to the current environment
     data(andechs)
     
     ## call isopam with the standard options
     ip<-isopam(andechs)
     
     ## examine cluster hierarchy
     plot(ip)
     
     ## examine grouping
     ip$flat 

     ## examine frequency table (second hierarchy level)
     isotab(ip, 2)
     
     ## non-hierarchical partitioning
     ip<-isopam(andechs,c.fix=3)
     ip$flat
     
     


