library(SmCCNet)


### Name: plotMultiOmicsNetwork
### Title: Plot multi-omics module networks.
### Aliases: plotMultiOmicsNetwork

### ** Examples

set.seed(123)
w <- rnorm(5)
w <- w/sqrt(sum(w^2))
abar <- getAbar(w, P1 = 2, FeatureLabel = NULL)
modules <- getMultiOmicsModules(abar, P1 = 2, CutHeight = 0.5)
x <- cbind(geneExpr[ ,seq_len(2)], mirnaExpr[ , seq_len(3)])
corr <- cor(x)

plotMultiOmicsNetwork(abar, corr, modules, ModuleIdx = 1, P1 = 2)




