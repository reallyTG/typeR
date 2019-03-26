library(tuple)


### Name: tuplicate
### Title: Find n-Replicated Elements
### Aliases: tuplicate
### Keywords: match n-replicate, n-replicated, repeat, repeated,

### ** Examples

x <- c(NA, 1:3, 4:5, rep(6, 6), 3, NA, 4, 3, 3)
lapply(2:6, function(X) { tuplicate(x, X) })



