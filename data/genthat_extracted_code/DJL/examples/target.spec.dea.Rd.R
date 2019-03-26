library(DJL)


### Name: target.spec.dea
### Title: Spec target setting using DEA
### Aliases: target.spec.dea

### ** Examples

# Reproduce Example 2 in Wei, Q. et al.(2000)
  # ready
  x <- matrix(c(1, 1, 1), 3)
  y <- matrix(c(4, 8, 5, 8, 4, 5), 3)
  a <- matrix(1.8, 1)
  w <- matrix(c(0.5, 0.5), 1)
  
  # go
  target.spec.dea(x, y, dmu = 3, alpha = a, wv = w, rts = "crs")$beta

# Reproduce Table 4 in Lim, D-J. (2016)
  # Load engine dataset
    df <- dataset.engine.2015
  
  # Subset for forced induction systems
    fis <- subset(df, grepl("^.C..", df[, 8]))
  
  # ready
    # Suppose one wants to estimate Porsche 911 turbo s' engine specs
    # to retain its current competitiveness with downsized 3.5 litre engine in 2018.
    # What might be the minimum specs to achieve this goal
    # considering the technological changes we've seen so far?
    # Plus, the CEO wants to put more emphasis on the torque improvement over HP.
      d <- subset(fis, select = 2)
      x <- subset(fis, select = 4)
      y <- subset(fis, select = 6 : 7)
      a <- as.matrix(3.5)
      w <- matrix(c(0.3, 0.7), 1)
    
  # go
    target.spec.dea(x, y, d, 2015, 3, 262, alpha = a, wv = w, rts = "vrs", sg = "min")$beta



