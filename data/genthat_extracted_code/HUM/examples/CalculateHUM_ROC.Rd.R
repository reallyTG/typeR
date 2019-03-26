library(HUM)


### Name: CalculateHUM_ROC
### Title: Calculate HUM value
### Aliases: CalculateHUM_ROC
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



