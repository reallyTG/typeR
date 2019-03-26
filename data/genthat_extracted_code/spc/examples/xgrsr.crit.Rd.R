library(spc)


### Name: xgrsr.crit
### Title: Compute alarm thresholds for Shiryaev-Roberts schemes
### Aliases: xgrsr.crit
### Keywords: ts

### ** Examples

## Table 4 from Moustakides et al. (2009)
## original values are
# gamma/L0  A/exp(g)
# 50        28.02
# 100       56.04
# 500       280.19
# 1000      560.37
# 5000      2801.75
# 10000     5603.7
theta <- 1
zr <- -6
r <- 100
Lxgrsr.crit  <- Vectorize("xgrsr.crit", "L0")
L0s <- c(50, 100, 500, 1000, 5000, 10000)
gs <- Lxgrsr.crit(theta/2, L0s, zr=zr, r=r)
data.frame(L0s, gs, A=round(exp(gs), digits=2))



