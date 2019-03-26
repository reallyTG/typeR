library(dplR)


### Name: rcs
### Title: Regional Curve Standardization
### Aliases: rcs
### Keywords: manip

### ** Examples
library(utils)
data(gp.rwl)
data(gp.po)
gp.rwi <- rcs(rwl = gp.rwl, po = gp.po, biweight = TRUE,
              rc.out = TRUE, make.plot = FALSE)
str(gp.rwi)
gp.rwi <- rcs(rwl = gp.rwl, po = gp.po, biweight = TRUE,
              make.plot = TRUE, main = "Regional Curve")



