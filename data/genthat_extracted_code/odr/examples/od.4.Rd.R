library(odr)


### Name: od.4
### Title: Optimal sample allocation calculation for four-level CRTs
### Aliases: od.4

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
  myod1$out # output
# plots by p and K
  myod1 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01), plot.by = list(p = 'p', K = 'K'))

# constrained optimal design with p = 0.5 #---------
  myod2 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, p = 0.5,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.78

# constrained optimal design with K = 20 #---------
  myod3 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,  K = 20,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.67

# constrained n, J, K and p, no calculation performed #---------
  myod4 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
              r12 = 0.5, n = 10, J = 10, K = 20, p = 0.5,
              r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.27




