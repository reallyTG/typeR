library(pracma)


### Name: quadgr
### Title: Gaussian Quadrature with Richardson Extrapolation
### Aliases: quadgr
### Keywords: math

### ** Examples

##  Dilogarithm function
flog <- function(t) log(1-t)/t
quadgr(flog, 1, 0, tol = 1e-12)
# value
# 1.6449340668482 , is pi^2/6 = 1.64493406684823
# rel.err
# 2.07167616395054e-13



