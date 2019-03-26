library(pRoloc)


### Name: empPvalues
### Title: Estimate empirical p-values for Chi^2 protein correlations.
### Aliases: empPvalues

### ** Examples

set.seed(1)
mrk <- rnorm(6, 5, 1)
prot <- rbind(matrix(rnorm(120, 5, 1), ncol = 6),
              mrk + rnorm(6))
mrk <- mrk/sum(mrk)
prot <- prot/rowSums(prot)
empPvalues(mrk, prot)



