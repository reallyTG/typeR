library(RMThreshold)


### Name: rm.ev.density
### Title: Create a density plot and a histogram of the eigenvalue
###   distribution
### Aliases: rm.ev.density

### ** Examples

## Plot histogram of the spacings of the unfolded eigenvalues of a random matrix:
set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
res <- rm.ev.unfold(random.matrix)					  
rm.ev.density(res$eigenvalues, wigner = TRUE) 



