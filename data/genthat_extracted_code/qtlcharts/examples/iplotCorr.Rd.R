library(qtlcharts)


### Name: iplotCorr
### Title: Image of correlation matrix with linked scatterplot
### Aliases: iplotCorr
### Keywords: hplot

### ** Examples

data(geneExpr)
## No test: 
iplotCorr(geneExpr$expr, geneExpr$genotype, reorder=TRUE,
          chartOpts=list(cortitle="Correlation matrix",
                         scattitle="Scatterplot"))
## End(No test)

# use Spearman's correlation
corr <- cor(geneExpr$expr, method="spearman", use="pairwise.complete.obs")
# order by hierarchical clustering
o <- hclust(as.dist(1-corr))$order
## No test: 
iplotCorr(geneExpr$expr[,o], geneExpr$genotype, corr=corr[o,o],
          chartOpts=list(cortitle="Spearman correlation",
                         scattitle="Scatterplot"))
## End(No test)



