library(KOGMWU)


### Name: KOGMWU-package
### Title: Functional summary and meta-analysis of gene expression data
### Aliases: KOGMWU-package KOGMWU
### Keywords: package

### ** Examples

## Not run: 
##D data(adults.3dHeat.logFoldChange)
##D data(larvae.longTerm)
##D data(larvae.shortTerm)
##D data(gene2kog)
##D 
##D # Analyzing adult coral response to 3-day heat stress:
##D alfc.lth=kog.mwu(adults.3dHeat.logFoldChange,gene2kog) 
##D alfc.lth 
##D 
##D # coral larvae response to 5-day heat stress:
##D l.lth=kog.mwu(larvae.longTerm,gene2kog)
##D l.lth
##D 
##D # coral larvae response to 4-hour heat stress 
##D l.sth=kog.mwu(larvae.shortTerm,gene2kog)
##D l.sth
##D 
##D # compiling a table of delta-ranks to compare these results:
##D ktable=makeDeltaRanksTable(list("adults.long"=alfc.lth,"larvae.long"=l.lth,"larvae.short"=l.sth))
##D 
##D # Making a heatmap with hierarchical clustering trees: 
##D pheatmap(as.matrix(ktable),clustering_distance_cols="correlation") 
##D 
##D # exploring correlations between datasets
##D pairs(ktable, lower.panel = panel.smooth, upper.panel = panel.cor)
##D # p-values of these correlations in the upper panel:
##D pairs(ktable, lower.panel = panel.smooth, upper.panel = panel.cor.pval)
##D 
##D # plotting individual delta-rank correlations:
##D corrPlot(x="adults.long",y="larvae.long",ktable)
##D corrPlot(x="larvae.short",y="larvae.long",ktable)
## End(Not run)



