library(CpGassoc)


### Name: cpg.perm
### Title: Perform a Permutation Test of the Association Between
###   Methylation and a Phenotype of Interest
### Aliases: cpg.perm

### ** Examples

##Loading the data
data(samplecpg,samplepheno,package="CpGassoc")
###NOTE: If you are dealing with large data, do not specify large.data=FALSE.
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
#Performing a permutation 10 times
Testperm<-cpg.perm(samplecpg[1:200,],samplepheno$weight,seed=2314,nperm=10,large.data=FALSE)
Testperm
#All the contents of CpGassoc are included in the output from Testperm

#summary function works on objects of class cpg.perm
summary(Testperm)




