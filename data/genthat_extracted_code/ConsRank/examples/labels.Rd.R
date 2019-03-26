library(ConsRank)


### Name: labels
### Title: Transform a ranking into a ordering.
### Aliases: labels

### ** Examples

data(Idea)
TR=tabulaterows(Idea)
Ord=labels(TR$X,ncol(Idea),colnames(Idea),labs=1)
Ord2=labels(TR$X,ncol(Idea),labs=2)
cbind(Ord,TR$Wk)
cbind(Ord2,TR$Wk)




