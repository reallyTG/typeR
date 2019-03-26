library(odr)


### Name: od.4m
### Title: Optimal sample allocation calculation for four-level multisite
###   randomized trials
### Aliases: od.4m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005))
  myod1$out # output
# plots by p and K
  myod1 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005), plot.by = list(p = 'p', K = 'K'))

# constrained optimal design with p = 0.5 #---------
  myod2 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005), p = 0.5)
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.88

# constrained optimal design with J = 20 #---------
  myod3 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005), J = 20)
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.58

# constrained n, J, K and p, no calculation performed #---------
  myod4 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005), p = 0.5, n = 15, J = 20, K = 5)
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.46




