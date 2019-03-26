library(DJL)


### Name: map.soa.dea
### Title: SOA mapping using DEA
### Aliases: map.soa.dea

### ** Examples

# Load engine dataset
  df <- dataset.engine.2015

# Subset for forced induction systems
  fis <- subset(df, grepl("^.C..", df[, 8]))

# Parameters
  x <- subset(fis, select = 4)
  y <- subset(fis, select = 6 : 7)
  d <- subset(fis, select = 2)

# Generate an SOA map
  map.soa.dea(x, y, d, "crs", "o")



