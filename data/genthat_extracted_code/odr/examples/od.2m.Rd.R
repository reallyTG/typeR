library(odr)


### Name: od.2m
### Title: Optimal sample allocation calculation for two-level multisite
###   randomized trials
### Aliases: od.2m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.2m(icc = 0.2, omega = 0.02, r12 = 0.5, r22m = 0.5,
              c1 = 1, c2 = 10, c1t = 10,
              varlim = c(0, 0.005))
  myod1$out # n = 20, p =0.37
# plots by p
  myod1 <- od.2m(icc = 0.2, omega = 0.02,
              r12 = 0.5, r22m = 0.5,
              c1 = 1, c2 = 10, c1t = 10,
              varlim = c(0, 0.005), plot.by = list(p = 'p'))

# constrained optimal design with p = 0.5 #---------
  myod2 <- od.2m(icc = 0.2, omega = 0.02,
              r12 = 0.5, r22m = 0.5,
              c1 = 1, c2 = 10, c1t = 10,
              varlim = c(0, 0.005), p = 0.5)
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.86

# constrained optimal design with n = 5 #---------
  myod3 <- od.2m(icc = 0.2, omega = 0.02,
              r12 = 0.5, r22m = 0.5, c1 = 1, c2 = 10,
              c1t = 10, varlim = c(0, 0.005), n = 5)
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.79

# constrained n and p, no calculation performed #---------
  myod4 <- od.2m(icc = 0.2, omega = 0.02, r12 = 0.5, r22m = 0.5,
              c1 = 1, c2 = 10, c1t = 10,
              varlim = c(0, 0.005), p = 0.5, n = 10)
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.84




