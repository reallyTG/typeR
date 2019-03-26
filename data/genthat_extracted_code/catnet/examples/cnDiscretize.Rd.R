library(catnet)


### Name: cnDiscretize
### Title: Data Categorization
### Aliases: cnDiscretize

### ** Examples

  ps <- t(sapply(1:10, function(i) rnorm(20, i, 0.1)))
  dps1 <- cnDiscretize(ps, 3, mode="quantile")
  hist(dps1[1,])
  qlevels <- lapply(1:10, function(i) rep(1, 3))
  qlevels[[1]] <- c(1,2,1)
  dps2 <- cnDiscretize(ps, 3, mode="uniform", qlevels)
  hist(dps2[1,])



