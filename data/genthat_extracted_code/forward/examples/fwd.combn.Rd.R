library(forward)


### Name: fwd.combn
### Title: Generate all combinations of elements of x taken m at a time
### Aliases: fwd.combn fwd.nCm
### Keywords: math

### ** Examples

fwd.combn(letters[1:4], 2)
fwd.combn(10, 5, min)      # minimum value in each combination
# Different way of encoding points:
fwd.combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins = 4)
# Compute support points and (scaled) probabilities for a
# Multivariate-Hypergeometric(n = 3, N = c(4,3,2,1)) p.f.:
table(t(fwd.combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins=4)))



