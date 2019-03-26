library(interventionalDBN)


### Name: formatData
### Title: Format a microarray spreadsheet ready for interventional network
###   inference function
### Aliases: formatData

### ** Examples

data(interventionalData)
# Load your own data spreadsheet using myData<-read.csv("myDataFile.csv").

# Use everything
fullData <- formatData(interventionalData)

# Use only DMSO and EGFRi samples.
halfData <- formatData(interventionalData,inhibitors=c("DMSO","EGFRi"))

# Produce gradients as response
diffData <- formatData(interventionalData,gradients=TRUE,initialIntercept=FALSE)
# Different results if we use the time between observations, rather than the timepoint.
interventionalData[,4]<-rep(c(0,5,10,20,30,60,90,120),4)
diffData2 <- formatData(interventionalData,gradients=TRUE,initialIntercept=FALSE)

# When there is missing data, interpolation also uses the time differences. 
missingData <- interventionalData[-4,]
fullData2 <- formatData(missingData)



