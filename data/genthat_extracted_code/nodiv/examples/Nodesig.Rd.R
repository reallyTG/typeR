library(nodiv)


### Name: Nodesig
### Title: Compare the distributions of a pair of sister clades
### Aliases: Nodesig
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(coquettes)
res <- Nodesig(coquettes, repeats = 50)
hist(res$rval, xlim = 0:1)



