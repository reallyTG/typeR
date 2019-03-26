library(CpGassoc)


### Name: cpg.assoc
### Title: Association Analysis Between Methylation Beta Values and
###   Phenotype of Interest
### Aliases: cpg.assoc

### ** Examples

 # Sample output from CpGassoc
###NOTE: If you are dealing with large data, do not specify large.data=FALSE. 
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
data(samplecpg,samplepheno,package="CpGassoc")
results<-cpg.assoc(samplecpg,samplepheno$weight,large.data=FALSE)
results
#Analysis with covariates. There are multiple ways to do this. One can define the
#dataframe prior or do it in the function call.
test<-cpg.assoc(samplecpg,samplepheno$weight,data.frame(samplepheno$Distance,
samplepheno$Dose),large.data=FALSE)
# or
covar<-data.frame(samplepheno$Distance,samplepheno$Dose)
test2<-cpg.assoc(samplecpg,samplepheno$weight,covar,large.data=FALSE)


#Doing a mixed effects model. This does take more time, so we will do a subset of
#the samplecpg
randtest<-cpg.assoc(samplecpg[1:10,],samplepheno$weight,chip.id=samplepheno$chip,
random=TRUE,large.data=FALSE)
          


