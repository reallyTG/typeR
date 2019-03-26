library(DJL)


### Name: roc.dea
### Title: Rate of change (RoC) calculation using DEA
### Aliases: roc.dea

### ** Examples

# Reproduce Table 3 in Lim, D-J. et al.(2014)
  # Load airplane dataset
  df <- dataset.airplane.2017
  
  # ready
  x <- data.frame(Flew = rep(1, 28))
  y <- subset(df, select = 3 : 7)
  d <- subset(df, select = 2)

  # go
  roc.dea(x, y, d, 2007, "vrs", "o", "min", "d")$roc_past

# Reproduce Table 3 in Lim, D-J. et al.(2015)
  # Load hev dataset
  df <- dataset.hev.2013
  
  # ready
  x <- subset(df, select = 3)
  y <- subset(df, select = 4 : 6)
  d <- subset(df, select = 2)
  c <- subset(df, select = 7)

  # go
  results <- roc.dea(x, y, d, 2013, "vrs", "o", "min", "d", env = c)
  hev <- which(results$roc_local > 0)
  data.frame(Class = c[hev, ], 
             SOA = hev,
             LocalRoC = results$roc_local[hev, ])[order(c[hev, ]), ]
  # NOTE: the published results include a typo on roc_local[82,]
  #       this will be corrected in forthcoming book chapter(Lim, D-J. et al., 2016).



