library(Xplortext)


### Name: plot.LexCHCca
### Title: Plots for Chronological Constrained Hierarchical Clustering from
###   LexCHCca Objects
### Aliases: plot.LexCHCca
### Keywords: plot

### ** Examples

## Not run: 
##D data(open.question)
##D res.TD<-TextData(open.question,var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10,
##D         stop.word.tm=TRUE)
##D res.LexCA<-LexCA(res.TD, graph=FALSE)
##D res.chcca<-LexCHCca(res.LexCA, nb.clust=4, min=3, graph=FALSE)
##D plot(res.chc, choice="tree")
##D plot(res.chc, choice="map")
##D plot(res.chc, choice="bar", max.plot=5)
## End(Not run)



