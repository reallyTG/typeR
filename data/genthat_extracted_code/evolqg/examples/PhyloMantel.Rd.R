library(evolqg)


### Name: PhyloMantel
### Title: Mantel test with phylogenetic permutations
### Aliases: PhyloMantel

### ** Examples

data(dentus)
data(dentus.tree)
tree = dentus.tree
cor.matrices = dlply(dentus, .(species), function(x) cor(x[-5]))
comparisons = MatrixCor(cor.matrices)

sp.means = dlply(dentus, .(species), function(x) colMeans(x[-5]))
mh.dist = MultiMahalanobis(means = sp.means, cov.matrix = PhyloW(dentus.tree, cor.matrices)$'6')
PhyloMantel(dentus.tree, comparisons, mh.dist, k = 10000)

#similar to MantelCor for large k:
## Not run: 
##D PhyloMantel(dentus.tree, comparisons, mh.dist, k = 10000)
##D MantelCor(comparisons, mh.dist)
## End(Not run)



