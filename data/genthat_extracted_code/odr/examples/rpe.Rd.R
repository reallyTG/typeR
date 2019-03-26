library(odr)


### Name: rpe
### Title: Relative precision and efficiency (RPE) calculation
### Aliases: rpe

### ** Examples

# unconstrained optimal design of 2-level CRT #----------
  myod1 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              varlim = c(0.01, 0.02))
# constrained optimal design with n = 20
  myod2 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              n = 20, varlim = c(0.005, 0.025))
# relative precision and efficiency (RPE)
  myrpe <- rpe(od = myod1, subod= myod2)
  myrpe$out # RPE = 0.88
# constrained optimal design with p = 0.5
  myod2 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
             p = 0.5, varlim = c(0.005, 0.025))
# relative precision and efficiency (RPE)
  mypre <- rpe(od = myod1, subod= myod2)
  mypre$out # RPE = 0.90

# unconstrained optimal design of 3-level CRT #----------
  myod1 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0.005, 0.025))
# constrained optimal design with J = 20
  myod2 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5, J = 20,
             c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
             varlim = c(0, 0.025))
# relative precision and efficiency (RPE)
  myrpe <- rpe(od = myod1, subod= myod2)
  myrpe$out # RPE = 0.53

# unconstrained optimal design of 4-level CRT #---------
  myod1 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, r12 = 0.5,
              r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
# constrained optimal design with p = 0.5
  myod2 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, r12 = 0.5, p = 0.5,
              r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
              varlim = c(0, 0.01))
# relative precision and efficiency (RPE)
  myrpe <- rpe(od = myod1, subod= myod2)
  myrpe$out # RPE = 0.78




