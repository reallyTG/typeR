library(HUM)


### Name: CalcGene
### Title: Calculate HUM value
### Aliases: CalcGene
### Keywords: multivariate nonparametric plot roc auc

### ** Examples

data(sim)
# Basic example
indexF=3;
indexClass=2;
indexLabel=c("Normal","OrthArthr")
s_data=NULL;
prodValue=1;
for(i in 1:length(indexLabel))
{
  index=which(sim[,indexClass]==indexLabel[i])
  vrem=sort(sim[index,indexF])
  s_data=c(s_data,list(vrem))
  prodValue=prodValue*length(index)
}
len=length(indexLabel)
seqAll=permutations(len,len,1:len)
out=CalcGene(s_data, seqAll, prodValue)



