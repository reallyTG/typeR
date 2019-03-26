library(Omisc)


### Name: bootAnalysis
### Title: bootAnalysis
### Aliases: bootAnalysis

### ** Examples

data<-DFSimulated()
data<-doubleEnter(data[,1],data[,2],data[,3])
boots<-uniboot(data, 1000, "Rs", TRUE, .5, NULL)
results<-bootAnalysis(boots, cbind, FUN=DFanalysis, 1,2,3,TRUE,FALSE,FALSE,TRUE,FALSE)




