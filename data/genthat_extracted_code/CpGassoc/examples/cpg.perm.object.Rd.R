library(CpGassoc)


### Name: Class cpg.perm
### Title: Methods for object of class '"cpg.perm"'.
### Aliases: plot.cpg.perm summary.cpg.perm print.cpg.perm sort.cpg.perm
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(samplecpg,samplepheno,package="CpGassoc")
##We will do the analysis on a subset to save time
###NOTE: If you are dealing with large data, do not specify large.data=FALSE.
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
#The qq plot:
Testperm<-cpg.perm(samplecpg[1:300,],samplepheno$weight,seed=2314,nperm=10,large.data=FALSE)
plot(Testperm)
#The t-statistic plot from cpg.perm has confidence intervals since we were allowed 
#to perform permutations on the T-values.
plot(Testperm,tplot=TRUE)
#If there was 100 or more permutations, there would be emperical confidence intervals.

#Getting an example of the non classic QQ plot
plot(Testperm,classic=FALSE)


###Now for Sort
head(sort(Testperm)$results)
head(Testperm$results)






