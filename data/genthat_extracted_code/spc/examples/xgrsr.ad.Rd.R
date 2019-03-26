library(spc)


### Name: xgrsr.ad
### Title: Compute steady-state ARLs of Shiryaev-Roberts schemes
### Aliases: xgrsr.ad
### Keywords: ts

### ** Examples

## Small study to identify appropriate reflection border to mimic unreflected schemes
k <- .5
g <- log(390)
zrs <- -(0:10)
ZRxgrsr.ad <- Vectorize(xgrsr.ad, "zr")
ads <- ZRxgrsr.ad(k, g, 0, zr=zrs)
data.frame(zrs, ads)

## Table 2 from Knoth (2006)
## original values are
#  mu   arl
#  0    689
#  0.5  30
#  1    8.9
#  1.5  5.1
#  2    3.6
#  2.5  2.8
#  3    2.4
#
k <- .5
g <- log(390)
zr <- -5 # see first example
mus <- (0:6)/2
Mxgrsr.ad <- Vectorize(xgrsr.ad, "mu1")
ads <- round(Mxgrsr.ad(k, g, mus, zr=zr), digits=1)
data.frame(mus, ads)

## Table 4 from Moustakides et al. (2009)
## original values are
# gamma  A        STADD/steady-state ARL
# 50     28.02    4.37
# 100    56.04    5.46
# 500    280.19   8.33
# 1000   560.37   9.64
# 5000   2801.75  12.79
# 10000  5603.7   14.17
Gxgrsr.ad  <- Vectorize("xgrsr.ad", "g")
As <- c(28.02, 56.04, 280.19, 560.37, 2801.75, 5603.7)
gs <- log(As)
theta <- 1
zr <- -6
ads <- round(Gxgrsr.ad(theta/2, gs, theta, zr=zr, r=100), digits=2)
data.frame(As, ads)



