library(odr)


### Name: od.1
### Title: Optimal sample allocation calculation for individual randomized
###   controlled trials
### Aliases: od.1

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.1(r12 = 0.5, c1 = 1, c1t = 5, varlim = c(0, 0.2))
  myod1$out # output

# constrained p, no calculation performed #---------
  myod2 <- od.1(r12 = 0.5, c1 = 1, c1t = 5, varlim = c(0, 0.2), p = 0.5)
  myod2$out
# relative efficiency (RE)
  myre <- re(od = myod1, subod= myod2)
  myre$re # RE = 0.87

# when sampling costs are equal, a balanced  design with p = 0.5 is the best #---------
  myod3 <- od.1(r12 = 0.5, c1 = 1, c1t = 1, varlim = c(0, 0.2))
  myod3$out # output




