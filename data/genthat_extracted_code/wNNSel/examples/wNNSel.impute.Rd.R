library(wNNSel)


### Name: wNNSel.impute
### Title: Weighted Nearest Neighbor Imputation of Missing Values using
###   Selected Variables
### Aliases: wNNSel.impute
### Keywords: NA wNNSel weights

### ** Examples

  set.seed(3)
  x = matrix(rnorm(100),10,10)
  x.miss = x > 1
  x[x.miss] = NA
  wNNSel.impute(x)
  wNNSel.impute(x, lambda=0.5, m=2)



