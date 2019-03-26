library(odr)


### Name: od.2
### Title: Optimal sample allocation calculation for two-level CRTs
### Aliases: od.2

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              varlim = c(0.01, 0.02))
  myod1$out # output
# plot by p
  myod1 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              varlim = c(0.01, 0.02), plot.by = list(p = 'p'))

# constrained optimal design with n = 20 #---------
  myod2 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              n = 20, varlim = c(0.005, 0.025))
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.88

# constrained optimal design with p = 0.5 #---------
  myod3 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
             p = 0.5, varlim = c(0.005, 0.025))
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.90

# constrained n and p, no calculation performed #---------
  myod4 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              n = 20, p = 0.5, varlim = c(0.005, 0.025))
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.83




