library(CpGassoc)


### Name: cpg.GC
### Title: cpg.GC and methods for output of function
### Aliases: cpg.GC print.cpg.gc print.cpg.perm.gc
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(samplecpg,samplepheno,package="CpGassoc")
results<-cpg.assoc(samplecpg,samplepheno$weight,large.data=FALSE)

cpg.GC(results)
##If the genomic inflation factor is less than one there is no need for adjustment




