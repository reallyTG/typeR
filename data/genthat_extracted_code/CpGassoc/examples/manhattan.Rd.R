library(CpGassoc)


### Name: manhattan
### Title: Create a manhattan plot
### Aliases: manhattan
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Doing a Manhattan plot. First load the data:
###NOTE: If you are dealing with large data, do not specify large.data=FALSE. 
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
data(samplecpg,samplepheno,annotation,package="CpGassoc")

examplemanhat<-cpg.assoc(samplecpg,samplepheno$Disease,large.data=FALSE)

manhattan(examplemanhat,annotation$TargetID,annotation$CHR,annotation$MAPINFO)





