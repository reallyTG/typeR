library(fmri)


### Name: fmri.design
### Title: Linear Model for FMRI Data
### Aliases: fmri.design
### Keywords: regression design

### ** Examples

  # Example 1
  hrf <- fmri.stimulus(107, c(18, 48, 78), 15, 2)
  z <- fmri.design(hrf, 2)
  par(mfrow=c(2, 2))
  for (i in 1:4) plot(z[, i], type="l")



