library(bit64)


### Name: prank
### Title: (P)ercent (Rank)s
### Aliases: prank prank.integer64
### Keywords: univar

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
prank(x)

x <- x[!is.na(x)]
stopifnot(identical(x,  unname(qtile(x, probs=prank(x)))))



