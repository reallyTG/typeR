library(Xplortext)


### Name: LexCHCca
### Title: Chronogically Constrained Agglomerative Hierarchical Clustering
###   on Correspondence Analysis Components (LexCHCca)
### Aliases: LexCHCca
### Keywords: multivariate

### ** Examples

data(open.question)
res.TD<-TextData(open.question,var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10, 
        stop.word.tm=TRUE)
res.LexCA<-LexCA(res.TD, graph=FALSE)
res.ccah<-LexCHCca(res.LexCA, nb.clust=4, min=3)



