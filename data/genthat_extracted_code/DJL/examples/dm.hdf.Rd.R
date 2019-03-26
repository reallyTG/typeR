library(DJL)


### Name: dm.hdf
### Title: Distance measure using HDF
### Aliases: dm.hdf

### ** Examples

# Reproduce Table 2 in Fare et al.(2016)
  # ready
  x <- data.frame(x1 = c(2, 4, 9, 6.5, 10, 6, 9))
  y <- data.frame(y1 = c(3, 7, 10, 8.5, 4, 2, 8))

  # go
  sf  <- dm.sf (x, y, "vrs")$eff
  hdf <- dm.hdf(x, y, "vrs")$eff
  matrix(t(cbind(sf, hdf)), 2, 7, 
         dimnames = list(c("SF", "HDF"), 
                         paste0("DMU_", c(letters[1:4], "o", "p", "q")))) 




