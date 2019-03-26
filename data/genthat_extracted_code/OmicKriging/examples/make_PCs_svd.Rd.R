library(OmicKriging)


### Name: make_PCs_svd
### Title: Run Principal Component Analysis (PCA) using base R svd()
###   function.
### Aliases: make_PCs_svd
### Keywords: GRM PCA, covariate,

### ** Examples

 ## compute PC's using the  gene expression correlation matrix from vignette
 ## load gene expression values from vignette
 expressionFile <- system.file(package = "OmicKriging",
                     "doc/vignette_data/ig_gene_subset.txt.gz")
 ## compute correlation matrix
 geneCorrelationMatrix <- make_GXM(expressionFile)
 ## find top ten PC's of this matrix using SVD
 topPcs <- make_PCs_svd(geneCorrelationMatrix, n.top=10) 



