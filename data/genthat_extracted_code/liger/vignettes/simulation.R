## ---- eval=FALSE---------------------------------------------------------
#  require(devtools)
#  devtools::install_github("JEFworks/liger")

## ---- data---------------------------------------------------------------
set.seed(0)

library(liger)
# load gene set
data("org.Hs.GO2Symbol.list")  
# get universe
universe <- unique(unlist(org.Hs.GO2Symbol.list))
# get genes in a geneset
gs <- org.Hs.GO2Symbol.list[[1]]
# geneset name
names(org.Hs.GO2Symbol.list)[1] 

# make random data
Nsamples <- 100
Mgenes <- length(universe)
mat <- matrix(rnorm(Nsamples * Mgenes, 5, 10), Mgenes, Nsamples)
colnames(mat) <- paste0('sample', 1:Nsamples)
rownames(mat) <- universe

# let half the samples be in one biological state and the other half a different one
# simulate differential expression for genes in the geneset
mat[gs, 1:round(Nsamples/2)] <- rnorm(length(gs)*round(Nsamples/2), 10, 10)

# we can visualize this weak differential expression visually in a heatmap
# visualize weakly differentially expressed genes and another 50 genes
vi <- c(gs, universe[1:50]) 
# label supposedly differentially expressed genes 
heatmap(mat[vi,], Rowv=NA, Colv=NA, scale="none", 
        col=colorRampPalette(c("blue", "white", "red"))(100),
        RowSideColors = rainbow(2)[as.factor(vi %in% gs)]) 

## ---- diffexp------------------------------------------------------------
# run differential expression analysis
vals <- sapply(1:nrow(mat), function(i) {
  pv <- t.test(mat[i, 1:round(Nsamples/2)], mat[i, round(Nsamples/2+1):Nsamples])$p.val
  pv
})
names(vals) <- rownames(mat)
vals <- -log10(vals)
# look at -log10(p values) for genes that are supposedly differentially expressed
barplot(sort(vals[gs], decreasing=TRUE), ylim=c(0, 10))
# multiple testing correction line
bonf <- function(a, n) { 1 - (1-a) ** (1/n) }
abline(h = -log10(bonf(0.05, nrow(mat))), col="red")

## ---- gsea---------------------------------------------------------------
# run iterative bulk gsea
gseaVals <- iterative.bulk.gsea(values = vals, set.list = org.Hs.GO2Symbol.list[1:100], n.rand=500)
# identify significant genesets
gseaSig <- rownames(gseaVals[gseaVals$q.val < 0.05 & gseaVals$sscore > 0,])
gseaSig
# look at plots
for(i in seq_along(gseaSig)) {
  gs <- org.Hs.GO2Symbol.list[[gseaSig[i]]]
  gsea(values=vals, geneset=gs, mc.cores=1, plot=TRUE, n.rand=500)
}

## ---- echo=TRUE----------------------------------------------------------
sessionInfo()

