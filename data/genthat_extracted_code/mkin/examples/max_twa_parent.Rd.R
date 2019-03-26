library(mkin)


### Name: max_twa_parent
### Title: Function to calculate maximum time weighted average
###   concentrations from kinetic models fitted with mkinfit
### Aliases: max_twa_parent
### Keywords: manip

### ** Examples

  fit <- mkinfit("FOMC", FOCUS_2006_C, quiet = TRUE)
  max_twa_parent(fit, c(7, 21))  



