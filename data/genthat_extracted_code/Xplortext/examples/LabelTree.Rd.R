library(Xplortext)


### Name: LabelTree
### Title: Hierarchical words (LabelTree)
### Aliases: LabelTree
### Keywords: multivariate

### ** Examples

data(open.question)
res.TD<-TextData(open.question,var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10,
        stop.word.tm=TRUE)
res.LexCA<-LexCA(res.TD, graph=FALSE)
res.CHCca<-LexCHCca(res.LexCA, nb.clust=4, min=3)
res<-LabelTree(res.CHCca)



