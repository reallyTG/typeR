library(lfstat)


### Name: evfit
### Title: Fit an extreme value distribution to observations
### Aliases: evfit
### Keywords: low-flow fitting

### ** Examples

data("ngaruroro")
ng <- as.xts(ngaruroro)
minima <- as.vector(apply.yearly(ng$discharge, min, na.rm = TRUE))
evfit(x = minima, distribution = c("wei", "gevR"),
      extreme = "minimum")



