library(adjclust)


### Name: snpClust
### Title: Adjacency-constrained Clustering of Single Nucleotide
###   Polymorphisms
### Aliases: snpClust

### ** Examples

## a very small example
if (requireNamespace("snpStats", quietly = TRUE)) {
  data(testdata, package = "snpStats")

  # input as snpStats::SnpMatrix
  fit1 <- snpClust(Autosomes[1:200, 1:5], h = 3, stats = "R.squared")

  # input as base::matrix
  fit2 <- snpClust(as.matrix(Autosomes[1:200, 1:5]), h = 3, stats = "R.squared")

  # input as Matrix::dgCMatrix
  ldres <- snpStats::ld(Autosomes[1:200, 1:5], depth = 3, stats = "R.squared")
  fit3 <- snpClust(ldres, 3)
}




