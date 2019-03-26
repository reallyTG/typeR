library(bit64)


### Name: keypos
### Title: Extract Positions in redundant dimension table
### Aliases: keypos keypos.integer64
### Keywords: manip univar

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
keypos(x)

stopifnot(identical(keypos(x),  match.integer64(x, sort(unique(x), na.last=FALSE))))



