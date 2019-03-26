library(Biocomb)


### Name: Calculate3D
### Title: Plot the 3D-ROC curve
### Aliases: Calculate3D
### Keywords: feature selection classification HUM values AUC values
###   missing values

### ** Examples

data(leukemia72)
# Basic example
# class label must be factor
leukemia72[,ncol(leukemia72)]<-as.factor(leukemia72[,ncol(leukemia72)])

xdata=leukemia72

indexF=names(xdata)[10]

indexClass=ncol(xdata)
label=levels(xdata[,indexClass])
indexLabel=label

out=CalculateHUM_seq(xdata,indexF,indexClass,indexLabel)
HUM<-out$HUM
seq<-out$seq
out=CalculateHUM_ROC(xdata,indexF,indexClass,indexLabel,seq)
Calculate3D(indexF,out$Sn,out$Sp,out$S3,out$optSn,out$optSp,out$optS3,
out$thresholds,HUM,indexLabel[seq])



