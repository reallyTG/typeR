library(lsbclust)


### Name: meanheatmap
### Title: Plot Heatmap of A Matrix
### Aliases: meanheatmap

### ** Examples

set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(6, 6), nclust = c(5, 4, 6, 5))
meanheatmap(Map(tcrossprod, dat[[1]]$interactions$C, dat[[1]]$interactions$D))



