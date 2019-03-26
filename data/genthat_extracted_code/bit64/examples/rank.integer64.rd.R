library(bit64)


### Name: rank.integer64
### Title: Sample Ranks from integer64
### Aliases: rank.integer64
### Keywords: univar

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
rank.integer64(x)

stopifnot(identical(rank.integer64(x),  rank(as.integer(x)
, na.last="keep", ties.method = "average")))



