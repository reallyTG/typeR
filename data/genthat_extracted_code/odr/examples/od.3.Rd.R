library(odr)


### Name: od.3
### Title: Optimal sample allocation calculation for three-level CRTs
### Aliases: od.3

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0.005, 0.025))
  myod1$out # output
# plots by p and J
  myod1 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0.005, 0.025), plot.by = list(p = 'p', J = 'J'))

# constrained optimal design with J = 20 #---------
  myod2 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5, J = 20,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0, 0.025))
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.53

# constrained optimal design with p = 0.5 #---------
  myod3 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5, p = 0.5,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0.005, 0.025))
  myod3$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod3)
  myre$re # RE = 0.84

# constrained n, J and p, no calculation performed #---------
  myod4 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5, n = 10, J = 10, p = 0.5,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0, 0.025))
  myod4$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod4)
  myre$re # RE = 0.61




