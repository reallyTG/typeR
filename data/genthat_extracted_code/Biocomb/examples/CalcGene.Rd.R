library(Biocomb)


### Name: CalcGene
### Title: Calculate HUM value
### Aliases: CalcGene
### Keywords: feature selection classification HUM values AUC values
###   missing values

### ** Examples


data(leukemia72)
# Basic example
# class label must be factor
leukemia72[,ncol(leukemia72)]<-as.factor(leukemia72[,ncol(leukemia72)])

xdata=leukemia72
indexF=3
indexClass=ncol(xdata)
label=levels(xdata[,indexClass])

indexLabel=label[1:2]

indexL=NULL
for(i in 1:length(indexLabel))
{
  indexL=c(indexL,which(label==indexLabel[i]))
}

indexEach=NULL
indexUnion=NULL
for(i in 1:length(label))
{
  vrem=which(xdata[,indexClass]==label[i])
  indexEach=c(indexEach,list(vrem))
  if(length(intersect(label[i],indexLabel))==1)
  indexUnion=union(indexUnion,vrem)
}

s_data=NULL
dataV=xdata[,indexF]
prodValue=1

for (j in 1:length(indexLabel))
{
  vrem=sort(dataV[indexEach[[indexL[j]]]])
  s_data=c(s_data,list(vrem))
  prodValue = prodValue*length(vrem)
}

len=length(indexLabel)
seq=permutations(len,len,1:len)

#claculate the threshold values
thresholds <- sort(unique(dataV[indexUnion]))
thresholds=(c(-Inf, thresholds) + c(thresholds, +Inf))/2

out=CalcGene(s_data,seq,prodValue,thresholds)



