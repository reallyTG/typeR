library(OmicKriging)


### Name: make_GXM
### Title: Compute gene expression correlation matrix.
### Aliases: make_GXM

### ** Examples

 ## load gene expression values from vignette
 expressionFile <- system.file(package = "OmicKriging",
                     "doc/vignette_data/ig_gene_subset.txt.gz")
 ## compute correlation matrix
 geneCorrelationMatrix <- make_GXM(expressionFile)



