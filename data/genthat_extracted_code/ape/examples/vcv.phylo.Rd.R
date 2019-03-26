library(ape)


### Name: vcv
### Title: Phylogenetic Variance-covariance or Correlation Matrix
### Aliases: vcv vcv.phylo vcv.corPhyl
### Keywords: manip multivariate

### ** Examples

tr <- rtree(5)
## all are the same:
vcv(tr)
vcv(corBrownian(1, tr))
vcv(corPagel(1, tr))



