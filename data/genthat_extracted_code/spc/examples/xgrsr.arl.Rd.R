library(spc)


### Name: xgrsr.arl
### Title: Compute (zero-state) ARLs of Shiryaev-Roberts schemes
### Aliases: xgrsr.arl
### Keywords: ts

### ** Examples

## Small study to identify appropriate reflection border to mimic unreflected schemes
k <- .5
g <- log(390)
zrs <- -(0:10)
ZRxgrsr.arl <- Vectorize(xgrsr.arl, "zr")
arls <- ZRxgrsr.arl(k, g, 0, zr=zrs)
data.frame(zrs, arls)

## Table 2 from Knoth (2006)
## original values are
#  mu   arl
#  0    697
#  0.5  33
#  1    10.4
#  1.5  6.2
#  2    4.4
#  2.5  3.5
#  3    2.9
#
k <- .5
g <- log(390)
zr <- -5 # see first example
mus <- (0:6)/2
Mxgrsr.arl <- Vectorize(xgrsr.arl, "mu")
arls <- round(Mxgrsr.arl(k, g, mus, zr=zr), digits=1)
data.frame(mus, arls)

XGRSR.arl  <- Vectorize("xgrsr.arl", "g")
zr <- -6

## Table 2 from Moustakides et al. (2009)
## original values are
# gamma   A     ARL/E_infty(L) SADD/E_1(L)
#   50   47.17      50.29        41.40
#  100   94.34     100.28        72.32
#  500  471.70     500.28       209.44
# 1000  943.41    1000.28       298.50
# 5000 4717.04    5000.24       557.87
#10000 9434.08   10000.17       684.17

theta <- .1
As2 <- c(47.17, 94.34, 471.7, 943.41, 4717.04, 9434.08)
gs2 <- log(As2)
arls0 <- round(XGRSR.arl(theta/2, gs2, 0, zr=-5, r=300, MPT=TRUE), digits=2)
arls1 <- round(XGRSR.arl(theta/2, gs2, theta, zr=-5, r=300, MPT=TRUE), digits=2)
data.frame(As2, arls0, arls1)

## Table 3 from Moustakides et al. (2009)
## original values are
# gamma   A     ARL/E_infty(L) SADD/E_1(L)
#   50   37.38      49.45        12.30
#  100   74.76      99.45        16.60
#  500  373.81     499.45        28.05
# 1000  747.62     999.45        33.33
# 5000 3738.08    4999.45        45.96
#10000 7476.15    9999.24        51.49

theta <- .5
As3 <- c(37.38, 74.76, 373.81, 747.62, 3738.08, 7476.15)
gs3 <- log(As3)
arls0 <- round(XGRSR.arl(theta/2, gs3, 0, zr=-5, r=70, MPT=TRUE), digits=2)
arls1 <- round(XGRSR.arl(theta/2, gs3, theta, zr=-5, r=70, MPT=TRUE), digits=2)
data.frame(As3, arls0, arls1)

## Table 4 from Moustakides et al. (2009)
## original values are
# gamma   A     ARL/E_infty(L) SADD/E_1(L)
#   50   28.02      49.78         4.98
#  100   56.04      99.79         6.22
#  500  280.19     499.79         9.30
# 1000  560.37     999.79        10.66
# 5000 2801.85    5000.93        13.86
#10000 5603.70    9999.87        15.24

theta <- 1
As4 <- c(28.02, 56.04, 280.19, 560.37, 2801.85, 5603.7)
gs4 <- log(As4)
arls0 <- round(XGRSR.arl(theta/2, gs4, 0, zr=-6, r=40, MPT=TRUE), digits=2)
arls1 <- round(XGRSR.arl(theta/2, gs4, theta, zr=-6, r=40, MPT=TRUE), digits=2)
data.frame(As4, arls0, arls1)



