library(rv)


### Name: rvquantile
### Title: Componentwise Quantiles of Random Variables
### Aliases: rvquantile rvquantile.rv rvquantile.rvsummary rvmedian
### Keywords: classes

### ** Examples


  x <- rvnorm(3)
  rvquantile(x)
  rvquantile(x, probs=c(0, 0.01, 0.99, 1))
  rvmedian(x)




