library(DJL)


### Name: roc.hdf
### Title: Rate of change (RoC) calculation using HDF
### Aliases: roc.hdf

### ** Examples

# Load engine dataset
  df <- dataset.engine.2015

# Subset for 8 cylinder TC-P engines
  et <- subset(df, df[, 3] == 8 & df[, 8] == "TC-P")
  
# Parameters
  x <- subset(et, select = 4)
  y <- subset(et, select = 5 : 7)
  d <- subset(et, select = 2)
  w <- matrix(c(1, 0, 0), ncol = 3)

# Calc local Roc
  roc.hdf(x, y, d, 2015, "vrs", w, "min")



