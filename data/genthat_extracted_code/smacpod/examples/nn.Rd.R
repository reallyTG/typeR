library(smacpod)


### Name: nn
### Title: Determine nearest neighbors
### Aliases: nn

### ** Examples

data(grave)
# make distance matrix
d = as.matrix(dist(cbind(grave$x, grave$y)))
# 3 nearest neighbors
nnc = nn(d, k = 3, method = "c")
# nearest neighbors within k units of each observation
nnd = nn(d, k = 200, method = "d")



