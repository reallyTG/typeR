library(CpGassoc)


### Name: cpg.combine
### Title: Combine various objects of class '"cpg"'
### Aliases: cpg.combine

### ** Examples

data(samplecpg,samplepheno,package="CpGassoc")
###NOTE: If you are dealing with large data, do not specify large.data=FALSE. 
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
test1<-cpg.assoc(samplecpg[1:100,],samplepheno$weight,large.data=FALSE)
test2<-cpg.assoc(samplecpg[101:200,],samplepheno$weight,large.data=FALSE)
bigtest<-list(test1,test2)
overall<-cpg.combine(bigtest)
overall
      



