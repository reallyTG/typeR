library(DJL)


### Name: target.arrival.hdf
### Title: Arrival target setting using HDF
### Aliases: target.arrival.hdf

### ** Examples

# Estimate arrivals of MY2015 SC/TC 8 cylinder engines
  # Load engine dataset
    df <- dataset.engine.2015
  
  # Subset for SC/TC 8 cylinder engines
    stc.8 <- subset(df, grepl("^.C..", df[, 8]) & df[, 3] == 8)
  
  # Parameters
    x <- subset(stc.8, select = 4)
    y <- subset(stc.8, select = 5:7)
    d <- subset(stc.8, select = 2)
  
  # Generate an SOA map
    target.arrival.hdf(x, y, d, 2014, "vrs")



