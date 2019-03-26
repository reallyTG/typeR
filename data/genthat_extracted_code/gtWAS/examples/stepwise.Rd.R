library(gtWAS)


### Name: stepwise
### Title: stepwise regression
### Aliases: stepwise
### Keywords: Model Selection

### ** Examples

data(Tdata)
data(alldata)
independent <- "B"
nbase <- 100
AllData <- cbind(Tdata[colnames(Tdata)[1]],alldata[,1:nbase])
AllData <- sapply(AllData, as.numeric)
AllData <- as.data.frame(AllData)
stepwise(AllData,independent,selection="stepwise",select="SBC",sle=0.05,sls=0.05,Choose="SBC")



