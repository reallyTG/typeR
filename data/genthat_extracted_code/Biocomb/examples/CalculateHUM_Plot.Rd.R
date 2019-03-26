library(Biocomb)


### Name: CalculateHUM_Plot
### Title: Plot 2D-ROC curve
### Aliases: CalculateHUM_Plot
### Keywords: feature selection classification HUM values AUC values
###   missing values

### ** Examples

data(leukemia72)
# Basic example
# class label must be factor
leukemia72[,ncol(leukemia72)]<-as.factor(leukemia72[,ncol(leukemia72)])

xdata=leukemia72

indexF=names(xdata)[3]

indexClass=ncol(xdata)
label=levels(xdata[,indexClass])
indexLabel=label[1:2]

out=CalculateHUM_seq(xdata,indexF,indexClass,indexLabel)
HUM<-out$HUM
seq<-out$seq
out=CalculateHUM_ROC(xdata,indexF,indexClass,indexLabel,seq)

CalculateHUM_Plot(indexF,out$Sn,out$Sp,out$optSn,out$optSp,HUM)



