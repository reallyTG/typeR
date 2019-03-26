library(probhat)


### Name: rd_3_marginal
### Title: Marginal Distributions
### Aliases: marginal

### ** Examples

data (trees)
trees = as.matrix (trees)
nppdfmv.f = nppdfmv (trees)
muv = marginal (nppdfmv.f)
muv [[1]]



