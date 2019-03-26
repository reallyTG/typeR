library(bit64)


### Name: qtile
### Title: (Q)uan(Tile)s
### Aliases: qtile qtile.integer64 quantile.integer64 median.integer64
###   mean.integer64 summary.integer64
### Keywords: univar

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
qtile(x, probs=seq(0, 1, 0.25))
quantile(x, probs=seq(0, 1, 0.25), na.rm=TRUE)
median(x, na.rm=TRUE)
summary(x)

x <- x[!is.na(x)]
stopifnot(identical(x,  unname(qtile(x, probs=prank(x)))))



