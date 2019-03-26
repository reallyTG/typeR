library(DJL)


### Name: target.arrival.sf
### Title: Arrival target setting using SF
### Aliases: target.arrival.sf

### ** Examples

# Estimate arrivals of MY2013 hev models
  # Load hev dataset
  df <- dataset.hev.2013
  
  # ready
  x <- subset(df, select = 3)
  y <- subset(df, select = 4 : 6)
  d <- subset(df, select = 2)
  g <- data.frame(x, y)
  
  # go
  target.arrival.sf(x, y, d, 2012, "vrs", g)$arrival_seg



