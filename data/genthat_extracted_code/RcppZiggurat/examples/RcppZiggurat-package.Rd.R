library(RcppZiggurat)


### Name: RcppZiggurat-package
### Title: Collection and comparison of different Ziggurat RNGs
### Aliases: RcppZiggurat-package RcppZiggurat
### Keywords: package

### ** Examples

  set.seed(42)
  system.time(replicate(500, rnorm(10000)))

  zsetseed(42)
  system.time(replicate(500, zrnorm(10000)))



