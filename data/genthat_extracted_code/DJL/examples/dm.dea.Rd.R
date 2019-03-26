library(DJL)


### Name: dm.dea
### Title: Distance measure using DEA
### Aliases: dm.dea

### ** Examples

# Reproduce Table 3.9 (p.348) in Fried, H.O. et al.(2008)
  # ready
  X <- data.frame(x1 = c(8, 6,   3,   10, 6,   8,   8, 4),
                  x2 = c(8, 4.6, 1.9, 9,  3.6, 3.6, 9, 1.9))
  Y <- data.frame(y1 = c(8, 5,   2,   9,  4.5, 4.5, 7, 2))
  C <- data.frame(x1 = 0, x2 = 1, y1 = 0)

  # go
  data.frame(ALL_CRS = dm.dea(X, Y, "crs", "i")$eff,
             ALL_VRS = dm.dea(X, Y, "vrs", "i")$eff,
             NDF_CRS = dm.dea(X, Y, "crs", "i", ncv = C)$eff,
             NDF_VRS = dm.dea(X, Y, "vrs", "i", ncv = C)$eff,
             row.names = LETTERS[1 : 8])



