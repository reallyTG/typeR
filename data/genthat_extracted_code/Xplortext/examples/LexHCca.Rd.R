library(Xplortext)


### Name: LexHCca
### Title: Hierarchical Clustering of Documents on Textual Correspondence
###   Analysis Coordinates (LexHCca)
### Aliases: LexHCca
### Keywords: multivariate

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), Fmin=10, Dmin=10, stop.word.tm=TRUE,
        context.quali=c("Gender","Age_Group","Education"), context.quanti=c("Age"))
res.LexCA<-LexCA(res.TD, graph=FALSE, ncp=8)
res.hcca<-LexHCca(res.LexCA, graph=TRUE, nb.clust=5, order=TRUE)



