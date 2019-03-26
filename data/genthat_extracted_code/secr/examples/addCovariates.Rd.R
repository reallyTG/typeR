library(secr)


### Name: addCovariates
### Title: Add Covariates to Mask or Traps
### Aliases: addCovariates
### Keywords: manip

### ** Examples


## In the Lake Station skink study (see ?skink), habitat covariates were
## measured only at trap sites. Here we extrapolate to a mask, taking
## values for each mask point from the nearest trap.

LSmask <- make.mask(LStraps, buffer = 30, type = "trapbuffer")
tempmask <- addCovariates(LSmask, LStraps)
## show first few lines
head(covariates(tempmask))




