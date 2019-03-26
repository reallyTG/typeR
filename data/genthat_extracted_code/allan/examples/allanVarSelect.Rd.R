library(allan)


### Name: allanVarSelect
### Title: Memory Unlimited Forward Stepwise Variable Selection for Linear
###   Models
### Aliases: allanVarSelect
### Keywords: stepwise linear regression memory ~kwd2

### ** Examples

#Get external data.  For your own data skip this next line and replace all
#instance of SampleData with "YourFile.csv".
SampleData=system.file("extdata","SampleDataFile.csv", package = "allan")

#fit smaller data to biglm object
columnnames<-names(read.csv(SampleData, nrows=2,header=TRUE))
datafeed<-readinbigdata(SampleData,chunksize=1000,col.names=columnnames)
datafeed(TRUE)
firstchunk<-datafeed(FALSE)

#create a biglm model from the small chunk with all variables that will be consdered
#for variable selection.
bigmodel <- biglm(PurePremium ~ cont1 + cont2 + cont3 + cont4 + cont5,data=firstchunk,weights=~cont0)

#now run variable selection
FinalModel<-allanVarSelect(bigmodel,SampleData,SampleData,NumOfSteps=2,criteria="MSE",silent=FALSE)







