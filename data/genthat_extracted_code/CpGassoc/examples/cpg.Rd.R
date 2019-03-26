library(CpGassoc)


### Name: cpg
### Title: Methods for object of class '"cpg"'
### Aliases: plot.cpg summary.cpg print.cpg sort.cpg
### Keywords: ~kwd1 ~kwd2

### ** Examples

##Using the results from the example given in cpg.assoc.
###NOTE: If you are dealing with large data, do not specify large.data=FALSE. 
###The default option is true.
##This will involve partitioning up the data and performing more gc() to clear up space
##QQ Plot:
data(samplecpg,samplepheno,package="CpGassoc")
test<-cpg.assoc(samplecpg,samplepheno$weight,large.data=FALSE)
plot(test)
##t-statistic plot:
plot(test,tplot=TRUE)


#Getting our plot:
plot(test,classic=FALSE)


##Now an example of sort
head(sort(test)$results)

##Summary
summary(test)



