library(bit64)


### Name: tiepos
### Title: Extract Positions of Tied Elements
### Aliases: tiepos tiepos.integer64
### Keywords: manip univar

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
tiepos(x)

stopifnot(identical(tiepos(x),  (1:length(x))[duplicated(x) | rev(duplicated(rev(x)))]))



