library(QQperm)


### Name: igm.get.pvalues
### Title: The permutation-based empirical NULL distribution of P-values is
###   generated through label switching and permutation of the true
###   case/control assignment. To achieve this, for a given matrix it
###   randomly permutes the case and control labels of the original
###   configuration and then recomputes the two-tail Fisher's Exact test
###   for all genes. This is repeated n.permutation (e.g., 1000) times. For
###   each of the n.permutations the p-values are ordered and then the mean
###   of each rank-ordered estimate is taken across the n.permutations,
###   i.e., the average 1st order statistic, the average 2nd order
###   statistic, etc. These then represent the empirical estimates of the
###   expected ordered p-values (expected -log10(p-values)). This
###   empirical-based expected p-value distribution no longer depends on an
###   assumption that the p-values are uniformly distributed under the
###   null.
### Aliases: igm.get.pvalues

### ** Examples

#Ps  <- igm.get.pvalues(matrix, is.case)




