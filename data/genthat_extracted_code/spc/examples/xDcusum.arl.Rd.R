library(spc)


### Name: xDcusum.arl
### Title: Compute ARLs of CUSUM control charts under drift
### Aliases: xDcusum.arl
### Keywords: ts

### ** Examples

## Gan (1992)
## Table 1
## original values are
#   deltas  arl
#   0.0001  475
#   0.0005  261
#   0.0010  187
#   0.0020  129
#   0.0050  76.3
#   0.0100  52.0
#   0.0200  35.2
#   0.0500  21.4
#   0.1000  15.0
#   0.5000  6.95
#   1.0000  5.16
#   3.0000  3.30
## Not run: 
##D k <- .25
##D h <- 8
##D r <- 50
##D DxDcusum.arl <- Vectorize(xDcusum.arl, "delta")
##D deltas <- c(0.0001, 0.0005, 0.001, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5, 1, 3)
##D arl.like.Gan   <-
##D   round(DxDcusum.arl(k, h, deltas, r=r, with0=TRUE), digits=2)
##D arl.like.Knoth <-
##D   round(DxDcusum.arl(k, h, deltas, r=r, mode="Knoth", with0=TRUE), digits=2)
##D data.frame(deltas, arl.like.Gan, arl.like.Knoth)
## End(Not run)

## Zou et al. (2009)
## Table 1
## original values are
#  delta   arl1  arl2  arl3
#  0           ~ 1730
#  0.0005  345   412   470
#  0.001   231   275   317
#  0.005   86.6  98.6  112
#  0.01    56.9  61.8  69.3
#  0.05    22.6  21.6  22.7
#  0.1     15.4  14.7  14.2
#  0.5     6.60  5.54  5.17
#  1.0     4.63  3.80  3.45
#  2.0     3.17  2.67  2.32
#  3.0     2.79  2.04  1.96
#  4.0     2.10  1.98  1.74
## Not run: 
##D k1 <- 0.25
##D k2 <- 0.5
##D k3 <- 0.75
##D h1 <- 9.660
##D h2 <- 5.620
##D h3 <- 3.904
##D deltas <- c(0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1:4)
##D arl1 <- c(round(xcusum.arl(k1, h1, 0, r=r), digits=2),
##D           round(DxDcusum.arl(k1, h1, deltas, r=r), digits=2))
##D arl2 <- c(round(xcusum.arl(k2, h2, 0), digits=2),
##D           round(DxDcusum.arl(k2, h2, deltas, r=r), digits=2))
##D arl3 <- c(round(xcusum.arl(k3, h3, 0, r=r), digits=2),
##D           round(DxDcusum.arl(k3, h3, deltas, r=r), digits=2))
##D data.frame(delta=c(0, deltas), arl1, arl2, arl3)
## End(Not run)



