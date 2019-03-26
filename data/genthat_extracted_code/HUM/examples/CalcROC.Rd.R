library(HUM)


### Name: CalcROC
### Title: Calculate ROC points
### Aliases: CalcROC
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
indexF=names(sim[,c(3,4),drop = FALSE])
indexClass=2
label=unique(sim[,indexClass])
indexLabel=label[1:3]
out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)
HUM<-out$HUM
seq<-out$seq

indexL=NULL
for(i in 1:length(indexLabel))
{
  indexL=c(indexL,which(label==indexLabel[i]))
}
  
indexEach=NULL
indexUnion=NULL

for(i in 1:length(label))
{
  vrem=which(sim[,indexClass]==label[i])
  indexEach=c(indexEach,list(vrem))
  if(length(intersect(label[i],indexLabel))==1)
    indexUnion=union(indexUnion,vrem)
}
s_data=NULL
dataV=sim[,indexF[1]]  #single feature
prodValue=1
for (j in 1:length(indexLabel))
{
  vrem=sort(dataV[indexEach[[indexL[j]]]])

  s_data=c(s_data,list(vrem))
  prodValue = prodValue*length(vrem)
}
#calculate the threshold values for plot of 2D ROC and 3D ROC
thresholds <- sort(unique(dataV[indexUnion]))
thresholds=(c(-Inf, thresholds) + c(thresholds, +Inf))/2
  
out=CalcROC(s_data,seq[,indexF[1]], thresholds)



