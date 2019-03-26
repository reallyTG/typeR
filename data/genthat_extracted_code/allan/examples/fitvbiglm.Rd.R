library(allan)


### Name: fitvbiglm
### Title: Automated Fitting of Biglm Object
### Aliases: fitvbiglm
### Keywords: linear regression memory fit

### ** Examples

#Get external data.  For your own data skip this next line and replace all
#instance of SampleData with "YourFile.csv".
SampleData=system.file("extdata","SampleDataFile.csv", package = "allan")

#get smaller chunk of data to fit initial model
columnnames<-names(read.csv(SampleData, nrows=2,header=TRUE))
datafeed<-readinbigdata(SampleData,chunksize=1000,col.names=columnnames)
datafeed(TRUE)
firstchunk<-datafeed(FALSE)

#create a biglm model from the small chunk with all variables that will be consdered
#for variable selection.
bigmodel <- biglm(PurePremium ~ cont1 + cont2 + cont3 + cont4 + cont5,data=firstchunk,weights=~cont0)

#now fit the model on the humongous dataset
finalbigmodel<-fitvbiglm(bigmodel,SampleData)





