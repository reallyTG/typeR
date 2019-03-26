library(spatstat)


### Name: mean.linim
### Title: Mean, Median, Quantiles of Pixel Values on a Linear Network
### Aliases: mean.linim median.linim quantile.linim
### Keywords: spatial methods univar

### ** Examples

  M <- as.mask.psp(as.psp(simplenet))
  Z <- as.im(function(x,y) {x-y}, W=M)
  X <- linim(simplenet, Z)
  X
  mean(X)
  median(X)
  quantile(X)



