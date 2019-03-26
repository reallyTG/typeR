library(Biocomb)


### Name: CalculateHUM_Ex
### Title: Calculate HUM value
### Aliases: CalculateHUM_Ex
### Keywords: feature selection classification HUM values AUC values
###   missing values

### ** Examples

data(leukemia72)
# Basic example
# class label must be factor
leukemia72[,ncol(leukemia72)]<-as.factor(leukemia72[,ncol(leukemia72)])

xdata=leukemia72
indexF=c(1:2)
indexClass=ncol(xdata)
allLabel=levels(xdata[,indexClass])

amountL=2
out=CalculateHUM_Ex(xdata,indexF,indexClass,allLabel,amountL)



