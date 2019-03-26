library(ConsRank)


### Name: tabulaterows
### Title: Frequency distribution of a sample of rankings
### Aliases: tabulaterows
### Keywords: modal ranking

### ** Examples

data(Idea)
TR=tabulaterows(Idea)
FR=TR$Wk/sum(TR$Wk)
RF=cbind(TR$X,FR)
colnames(RF)=c(colnames(Idea),"fi")
#compute modal ranking
maxfreq=which(RF[,6]==max(RF[,6]))
labels(RF[maxfreq,1:5],5,colnames(Idea),labs=1)
#
data(APAred)
TR=tabulaterows(APAred)
#
data(APAFULL)
TR=tabulaterows(APAFULL)
CR1=EMCons(TR$X,TR$Wk)
CR2=FASTcons(TR$X,TR$Wk,maxiter=15)
CR3=QuickCons(TR$X,TR$Wk)




