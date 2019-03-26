library(secr)


### Name: distancetotrap
### Title: Distance To Nearest Detector
### Aliases: nearesttrap distancetotrap
### Keywords: manip

### ** Examples

  ## restrict a habitat mask to points within 70 m of traps  
  ## this is nearly equivalent to using make.mask with the 
  ## `trapbuffer' option
  temptrap <- make.grid()
  tempmask <- make.mask(temptrap)
  d <- distancetotrap(tempmask, temptrap)
  tempmask <- subset(tempmask, d < 70)



