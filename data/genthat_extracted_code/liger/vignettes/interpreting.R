## ------------------------------------------------------------------------
library(liger)

## ------------------------------------------------------------------------
# Simulate differential expression
set.seed(0)
X <- abs(rnorm(1000, 1)) # gene expression in condition X
Y <- abs(rnorm(1000, 1)) # gene expression in condition Y
fc <- log2(X/Y) # log 2 fold change
fc <- sort(fc, decreasing=TRUE)
names(fc) <- paste0('gene', 1:length(fc))
barplot(fc, xaxt='n')

## ------------------------------------------------------------------------
genesets <- list(
  A = paste0('gene', seq(from=1, to=100, by=10)),
  B = paste0('gene', seq(from=1, to=750, by=10)),
  C = paste0('gene', seq(from=250, to=1000, by=10)),
  D = paste0('gene', seq(from=900, to=1000, by=10))
)

## ------------------------------------------------------------------------
iterative.bulk.gsea(values = fc, set.list = genesets)

## ------------------------------------------------------------------------
gsea(values = fc, geneset = genesets$A)

## ------------------------------------------------------------------------
gsea(values = fc, geneset = genesets$D)

## ------------------------------------------------------------------------
gsea(values = fc, geneset = genesets$B)

## ------------------------------------------------------------------------
gsea(values = fc, geneset = genesets$C)

