library(Biocomb)


### Name: CalculateHUM_seq
### Title: Calculate HUM value
### Aliases: CalculateHUM_seq
### Keywords: feature selection classification HUM values AUC values
###   missing values

### ** Examples

data(leukemia72)
# Basic example
# class label must be factor
leukemia72[,ncol(leukemia72)]<-as.factor(leukemia72[,ncol(leukemia72)])

xdata=leukemia72
indexF=1:2
indexClass=ncol(xdata)
label=levels(xdata[,indexClass])
indexLabel=label[1:2]

out=CalculateHUM_seq(xdata,indexF,indexClass,indexLabel)




