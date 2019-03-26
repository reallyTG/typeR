library(qtl)


### Name: summary.scanPhyloQTL
### Title: Summarize the results a genome scan to map a QTL to a
###   phylogenetic tree
### Aliases: summary.scanPhyloQTL
### Keywords: print

### ** Examples

## Not run: 
##D # example map; drop X chromosome
##D data(map10)           
##D map10 <- map10[1:19]
##D 
##D # simulate data
##D x <- simPhyloQTL(4, partition="AB|CD", crosses=c("AB", "AC", "AD"),
##D                  map=map10, n.ind=150,
##D                  model=c(1, 50, 0.5, 0))
##D 
##D # run calc.genoprob on each cross
##D x <- lapply(x, calc.genoprob, step=2)
##D 
##D # scan genome, at each position trying all possible partitions
##D out <- scanPhyloQTL(x, method="hk")
##D 
##D # maximum peak
##D max(out, format="lod")
##D 
##D # approximate posterior probabilities at peak
##D max(out, format="postprob")
##D 
##D # all peaks above a threshold for LOD(best) - LOD(2nd best)
##D summary(out, threshold=1, format="lod")
##D 
##D # all peaks above a threshold for LOD(best), showing approx post'r prob
##D summary(out, format="postprob", threshold=3)
##D 
##D # plot of results
##D plot(out)
## End(Not run)



