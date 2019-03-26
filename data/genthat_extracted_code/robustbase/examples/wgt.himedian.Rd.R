library(robustbase)


### Name: wgt.himedian
### Title: Weighted Hi-Median
### Aliases: wgt.himedian
### Keywords: univar robust

### ** Examples

x <- c(1:6, 20)
median(x) ## 4
stopifnot(all.equal(4, wgt.himedian(x)),
          all.equal(6, wgt.himedian(x, c(rep(1,6), 5))))



