library(HUM)


### Name: CalculateHUM_Plot
### Title: Plot 2D-ROC curve
### Aliases: CalculateHUM_Plot
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
# Basic example
indexF=names(sim[,c(3),drop = FALSE])
indexClass=2
label=unique(sim[,indexClass])
indexLabel=label[1:2]
out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)
HUM<-out$HUM
seq<-out$seq
out=CalculateHUM_ROC(sim,indexF,indexClass,indexLabel,seq)
CalculateHUM_Plot(indexF,out$Sn,out$Sp,out$optSn,out$optSp,HUM)



