library(CpGassoc)


### Name: scatterplot
### Title: Plot beta values of individual CpG sites against the independent
###   variable.
### Aliases: scatterplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Load the data:
data(samplecpg,samplepheno,package="CpGassoc")
###NOTE: If you are dealing with large data, do not specify large.data=FALSE.
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
test<-cpg.assoc(samplecpg,samplepheno$weight,large.data=FALSE)
##Using rank, will plot the top three sites in order of significance:
scatterplot(test,c(1:3))
##Using name, specify three sites:
scatterplot(test,cpg.name=c("CpG1182","CpG1000","CpG42"))

##Plotting something that is categorical in nature:
test2<-cpg.assoc(samplecpg[1:200,],factor(samplepheno$Disease),large.data=FALSE)
scatterplot(test2,c(2),beta.values=samplecpg[1:200,])



