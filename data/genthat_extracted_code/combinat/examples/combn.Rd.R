library(combinat)


### Name: combn
### Title: Generate all combinations of the elements of x taken m at a
###   time.
### Aliases: combn combn2 nCm
### Keywords: models

### ** Examples

 combn(letters[1:4], 2)
 combn(10, 5, min)  # minimum value in each combination
# Different way of encoding points:
 combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins = 4)
#Compute support points and (scaled) probabilities for a
#Multivariate-Hypergeometric(n = 3, N = c(4,3,2,1)) p.f.:
# table.mat(t(combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate,nbins=4)))



