library(denpro)


### Name: profgene
### Title: Calculates the level set tree of a rectangularwise constant
###   function
### Aliases: profgene
### Keywords: multivariate

### ** Examples

recnum<-3
d<-2
value<-seq(1:recnum)
recs<-matrix(0,recnum,2*d)
recs[1,]<-c(0,1,0,1)
recs[2,]<-c(0,1,1,2)
recs[3,]<-c(1,2,0,2)
pg<-profgene(value,recs)




