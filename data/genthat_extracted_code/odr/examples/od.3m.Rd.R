library(odr)


### Name: od.3m
### Title: Optimal sample allocation calculation for three-level multisite
###   randomized trials
### Aliases: od.3m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005))
  myod1$out # output
# plots by p and J
  myod1 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005), plot.by = list(p = 'p', J = 'J'))

# constrained optimal design with p = 0.5 #---------
  myod2 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005), p = 0.5)
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.81

# constrained optimal design with n = 5 #---------
  myod3 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005), n = 5)
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.89

# constrained n, J and p, no calculation performed #---------
  myod4 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005), p = 0.5, n = 15, J = 20)
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.75




