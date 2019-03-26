library(liger)


### Name: bulk.gsea
### Title: Bulk gene set enrichment analysis
### Aliases: bulk.gsea

### ** Examples

data("org.Hs.GO2Symbol.list")  
universe <- unique(unlist(org.Hs.GO2Symbol.list))  # get universe
gs <- org.Hs.GO2Symbol.list[[1]]  # get a gene set
vals <- rnorm(length(universe), 0, 10)  # simulate values
names(vals) <- universe
vals[gs] <- rnorm(length(gs), 100, 10)  
gs.list <- org.Hs.GO2Symbol.list # get gene sets
# reduce n.rand for speed
bulk.gsea(values = vals, set.list = gs.list[1:3], mc.cores = 1, n.rand=100)




