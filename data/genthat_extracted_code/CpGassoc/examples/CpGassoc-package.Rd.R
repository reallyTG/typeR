library(CpGassoc)


### Name: CpGassoc-package
### Title: Association Between Methylation and a Phenotype of Interest
### Aliases: CpGassoc-package CpGassoc
### Keywords: package

### ** Examples

###NOTE: If you are dealing with large data, do not specify large.data=FALSE. 
###The default option is true
##This will involve partitioning up the data and performing more gc() to clear up space
##Using cpg.assoc:
data(samplecpg,samplepheno,package="CpGassoc")
results<-cpg.assoc(samplecpg,samplepheno$weight,large.data=FALSE)
results

##Using cpg.perm:
Testperm<-cpg.perm(samplecpg[1:200,],samplepheno$weight,data.frame(samplepheno$Dose),
                seed=2314,nperm=10,large.data=FALSE)
Testperm


#For more examples go to those two pages main help pages.



