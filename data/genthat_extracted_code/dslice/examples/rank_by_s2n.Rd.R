library(dslice)


### Name: rank_by_s2n
### Title: Ranking genes by signal to noise ratio
### Aliases: rank_by_s2n

### ** Examples

expdat <- matrix(rnorm(500), nrow = 25, ncol = 20)
label <- rep(c(0, 1), 10)
ranklist <- rank_by_s2n(expdat, label)



