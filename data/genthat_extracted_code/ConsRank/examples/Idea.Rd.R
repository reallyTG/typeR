library(ConsRank)


### Name: Idea
### Title: Idea data set
### Aliases: Idea
### Keywords: datasets

### ** Examples

data(Idea)
revIdea=6-Idea
TR=tabulaterows(revIdea)
CR=QuickCons(TR$X,TR$Wk)
colnames(CR$Consensus)=colnames(Idea)




