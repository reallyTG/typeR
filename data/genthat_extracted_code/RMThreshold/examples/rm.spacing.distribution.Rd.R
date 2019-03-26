library(RMThreshold)


### Name: rm.spacing.distribution
### Title: Plot the empirical distribution of the eigenvalue spacings
### Aliases: rm.spacing.distribution

### ** Examples

## Plot histogram of the spacings of the unfolded eigenvalues of a random matrix:
set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
res <- rm.ev.unfold(random.matrix)					  
rm.spacing.distribution(res$ev.spacing) 



