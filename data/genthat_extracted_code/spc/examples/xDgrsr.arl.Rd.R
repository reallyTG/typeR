library(spc)


### Name: xDgrsr.arl
### Title: Compute ARLs of Shiryaev-Roberts schemes under drift
### Aliases: xDgrsr.arl
### Keywords: ts

### ** Examples

## Not run: 
##D ## Monte Carlo example with 10^8 replicates
##D #   delta      arl    s.e.
##D #   0.0001 381.8240   0.0304
##D #   0.0005 238.4630   0.0148
##D #   0.001  177.4061   0.0097
##D #   0.002  125.9055   0.0061
##D #   0.005   75.7574   0.0031
##D #   0.01    50.2203   0.0018
##D #   0.02    32.9458   0.0011
##D #   0.05    18.9213   0.0005
##D #   0.1     12.6054   0.0003
##D #   0.5      5.2157   0.0001
##D #   1        3.6537   0.0001
##D #   3        2.0289   0.0000
##D k <- .5
##D L0 <- 500
##D zr <- -7
##D r <- 50
##D g <- xgrsr.crit(k, L0, zr=zr, r=r)
##D DxDgrsr.arl <- Vectorize(xDgrsr.arl, "delta")
##D deltas <- c(0.0001, 0.0005, 0.001, 0.002, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5, 1, 3)
##D arls <- round(DxDgrsr.arl(k, g, deltas, zr=zr, r=r), digits=4)
##D data.frame(deltas, arls)
## End(Not run)



