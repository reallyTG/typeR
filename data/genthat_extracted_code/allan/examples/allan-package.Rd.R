library(allan)


### Name: allan-package
### Title: Automated Large Linear Analysis Node
### Aliases: allan-package allan
### Keywords: package linear regression selection memory unbounded large

### ** Examples

#Get external data.  For your own data skip this next line and replace all
#instance of SampleData with "YourFile.csv".
SampleData=system.file("extdata","SampleDataFile.csv", package = "allan")

#get column names of dataset
columnnames<-names(read.csv(SampleData, nrows=2,header=TRUE))

#use the readinbigdata function to grab a small portion of the data
datafunction<-readinbigdata(SampleData,chunksize=1000,col.names=columnnames)

#initialize dataset and set to first line with TRUE
datafunction(TRUE)

#assign a small chunk to a dataset to create a biglm object
smallchunk<-datafunction(FALSE)

#fit a biglm object with all variables being considered for model
bigmodel <- biglm(PurePremium ~ cont1 + cont2 + cont3 + cont4 + cont5,data=smallchunk,weights=~cont0)

#perform var selection and look for best 3 variables using MSE as a metric.  You
#should use a different file for validation but for simplicity here we use same.
bestmodel<-allanVarSelect(bigmodel,SampleData,SampleData,NumOfSteps=3,criteria="MSE",silent=FALSE)

#just for fun, fit the full model again
bestmodelagain<-fitvbiglm(bigmodel,SampleData)





