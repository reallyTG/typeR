library(HUM)


### Name: Calculate3D
### Title: Plot the 3D-ROC curve
### Aliases: Calculate3D
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
indexF=names(sim[,c(3),drop = FALSE])
indexClass=2
label=unique(sim[,indexClass])
indexLabel=label[1:3]
out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)
HUM<-out$HUM
seq<-out$seq
out=CalculateHUM_ROC(sim,indexF,indexClass,indexLabel,seq)
Calculate3D(indexF,out$Sn,out$Sp,out$S3,out$optSn,out$optSp,out$optS3,
out$thresholds,HUM,indexLabel[seq])



