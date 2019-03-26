library(liger)


### Name: gsea
### Title: Gene set enrichment analysis
### Aliases: gsea

### ** Examples

data("org.Hs.GO2Symbol.list")  
universe <- unique(unlist(org.Hs.GO2Symbol.list))  # get universe
gs <- org.Hs.GO2Symbol.list[[1]]  # get a gene set
# fake dummy example where everything in gene set is perfectly enriched
vals <- rnorm(length(universe), 0, 10)  
names(vals) <- universe
vals[gs] <- rnorm(length(gs), 100, 10)
# test obviously enriched set, reduce n.rand for speed
gsea(values=vals, geneset=gs, mc.cores=1, n.rand=100) 




