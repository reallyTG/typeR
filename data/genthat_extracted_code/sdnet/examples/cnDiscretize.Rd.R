library(sdnet)


### Name: cnDiscretize
### Title: Data Categorization
### Aliases: cnDiscretize

### ** Examples

  ps <- t(sapply(1:10, function(i) rnorm(20, i, 0.1)))
  dps1 <- cnDiscretize(data=ps, numcats=3, mode="hard", marginal="quantile")
  hist(dps1[1,])



