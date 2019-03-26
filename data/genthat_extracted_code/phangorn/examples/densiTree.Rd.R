library(phangorn)


### Name: densiTree
### Title: Plots a densiTree.
### Aliases: densiTree
### Keywords: plot

### ** Examples

  
data(Laurasiatherian)
set.seed(1)
bs <- bootstrap.phyDat(Laurasiatherian, FUN = 
   function(x) upgma(dist.hamming(x)), bs=25)
# cladogram nice to show topological differences
densiTree(bs, type="cladogram", col="blue")
densiTree(bs, type="phylogram", col="green", direction="downwards", width=2)
# plot five trees slightly shifted, no transparent color 
densiTree(bs[1:5], type="phylogram", col=1:5, width=2, jitter=
    list(amount=.3, random=FALSE), alpha=1)
## Not run: 
##D # phylograms are nice to show different age estimates
##D require(PhyloOrchard)
##D data(BinindaEmondsEtAl2007)
##D BinindaEmondsEtAl2007 <- .compressTipLabel(BinindaEmondsEtAl2007) 
##D densiTree(BinindaEmondsEtAl2007, type="phylogram", col="red")
## End(Not run)





