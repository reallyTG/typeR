## ---- echo=TRUE----------------------------------------------------------
library(liger)
# load gene set
data("org.Hs.GO2Symbol.list")  
# get universe
universe <- unique(unlist(org.Hs.GO2Symbol.list))
# get a gene set
gs <- org.Hs.GO2Symbol.list[[1]]
# fake dummy example where everything in gene set is perfectly enriched
vals <- rnorm(length(universe), 0, 10)
names(vals) <- universe
vals[gs] <- rnorm(length(gs), 100, 10)

head(vals)  # look at vals

## ---- echo=TRUE----------------------------------------------------------
names(org.Hs.GO2Symbol.list)[[1]]
gs  # look at gs
gsea(values=vals, geneset=gs, mc.cores=1, plot=TRUE, n.rand=500)

## ---- echo=TRUE----------------------------------------------------------
gs.new <- org.Hs.GO2Symbol.list[[2]]
names(org.Hs.GO2Symbol.list)[[2]]
head(gs.new)  # look at gs.new
gsea(values=vals, geneset=gs.new, mc.cores=1, n.rand=500)

## ---- echo=TRUE----------------------------------------------------------
# add some noise
vals[sample(1:length(universe), 1000)] <-  rnorm(1000, 100, 10)
# test previously perfectly enriched gene set again
gs <- org.Hs.GO2Symbol.list[[1]]
gsea(values=vals, geneset=gs, mc.cores=1, n.rand=500)

## ---- echo=TRUE----------------------------------------------------------
bulk.gsea(values=vals, set.list=org.Hs.GO2Symbol.list[1:5], mc.cores=1, n.rand=500)

## ---- echo=TRUE----------------------------------------------------------
iterative.bulk.gsea(values=vals, set.list=org.Hs.GO2Symbol.list[1:5], mc.cores=1, n.rand=500)

## ---- echo=TRUE----------------------------------------------------------
sessionInfo()

