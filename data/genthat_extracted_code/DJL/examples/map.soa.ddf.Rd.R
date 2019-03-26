library(DJL)


### Name: map.soa.ddf
### Title: SOA mapping using DDF
### Aliases: map.soa.ddf

### ** Examples

# Load engine dataset
  df <- dataset.engine.2015

# Subset for forced induction systems
  fis <- subset(df, grepl("^.C..", df[, 8]))

# Parameters
  x <- subset(fis, select = 4)
  y <- subset(fis, select = 6 : 7)
  d <- subset(fis, select = 2)
  g <- matrix(c(1), nrow = nrow(x), ncol = 3)

# Generate an SOA map
  map.soa.ddf(x, y, d, "crs", g)



