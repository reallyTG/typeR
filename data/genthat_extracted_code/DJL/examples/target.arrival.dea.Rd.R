library(DJL)


### Name: target.arrival.dea
### Title: Arrival target setting using DEA
### Aliases: target.arrival.dea

### ** Examples

# Reproduce Table 4 in Lim, D-J., and Timothy R. Anderson.(2016)
  # Load airplane dataset
  df <- dataset.airplane.2017
  
  # ready
  x <- data.frame(Flew = rep(1, 28))
  y <- subset(df, select = 3 : 7)
  d <- subset(df, select = 2)

  # go
  target.arrival.dea(x, y, d, 2007, "vrs", "o", "min", "d")$arrival_seg



