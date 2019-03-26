library(qtlcharts)


### Name: geneExpr
### Title: Anonymized gene expression data
### Aliases: geneExpr
### Keywords: datasets

### ** Examples

data(geneExpr)
## No test: 
# heat map of correlation matrix, linked to scatterplots
iplotCorr(geneExpr$expr, geneExpr$genotype, reorder=TRUE)
## End(No test)



