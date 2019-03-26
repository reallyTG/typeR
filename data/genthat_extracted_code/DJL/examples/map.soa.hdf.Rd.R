library(DJL)


### Name: map.soa.hdf
### Title: SOA mapping using HDF
### Aliases: map.soa.hdf

### ** Examples

# Load engine dataset
  df <- dataset.engine.2015

# Subset for SC/TC 8 cylinder engines
  stc.8 <- subset(df, grepl("^.C..", df[, 8]) & df[, 3] == 8)

# Parameters
  x <- subset(stc.8, select = 4)
  y <- subset(stc.8, select = 5:7)
  d <- subset(stc.8, select = 2)

# Generate an SOA map
  map.soa.hdf(x, y, d, "vrs")



